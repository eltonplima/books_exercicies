defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html" do
    videos = [
      %Rumbl.Multimedia.Video{id: "1", title: "dogs"},
      %Rumbl.Multimedia.Video{id: "2", title: "cats"}
    ]

    content = render_to_string(RumblWeb.VideoView, "index.html", conn: conn, videos: videos)

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html" do
    owner = %Rumbl.Accounts.User{}
    changeset = Rumbl.Multimedia.change_video(owner, %RumblMultimedia.Video{})
    categories = [%Rumbl.Multimedia.Category{id: 123, name: "cats"}]
    content = render_to_string(RumblWeb.VideoView, "new.html", conn: conn, changeset: changeset, categories: categories)

    assert String.contains?(content, "New Video")
  end
end

