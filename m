Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441F138E
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712639624; cv=none; b=F5bMDcefQtCTQzIxdiaC2PCBXcREuI4hzPqxIZQQDG/bvjt6RoZ+WLZSxjQlZApRnvf3+FCqrZYKdP1UzcQTdD/OfWFv8tGQzGRKbzwbosGET88KGeLhde1tOmr+wpoVq1C8/VOdxpJGHiy/yuvIokJ0bd35qxRvGurQsZAllyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712639624; c=relaxed/simple;
	bh=KKjF/zFeP2l4ureM8YQ44jPQw1jLe60wvSyJYXpz6XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lys61r118eTQu46e3laqOa36z6wEDZZIvdSY8hfcQEvuf5mUqIW3Cs9dWPuYJH0Z8rgQjVHtN4YgnsLwKJn/4+ZSQZ7axfiFhS1QPjR2bzD43wsTkaRlxzD7mLdaS3YT2JYRA9UKfBAsHN9mq1zoIL5R9EioaRMWfN+xrfg/7uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RCppTDh6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RCppTDh6"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-434b5abbb0dso184021cf.0
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712639621; x=1713244421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6G7fQwZrU8Ut2ONWgYwB5iUHvGBDAPNe+jjAW2C4Mg=;
        b=RCppTDh6ijs1/XeIThyvU4cOYfjS4HD0KNoJscfNVcipRVDVo3TQ5Ss2C7adBz6V/J
         9y2UBxoLfappKxuROeYcXBqQFNBm6e+ZCNlzCfQlaLcjQXsr8dBRFiAfuK6AbvJNHc9U
         3BIvuUdJGtgOdpIHvqRVrHp7kSf+/xBCtPPEzkqE6i/X+RPXAkAl7SlXMUro7gje8QrS
         S+CmfoG4FoxXKCpQOkOQVrm6NT3ff6iFiBzgCWf4jx0ZuTNDMHccgX5TP3nyyJJAh7zX
         ybjDQAtoJUcy6bckT6wNvqX8u0Af8LJQpmS0UJNYIluJ00NMwW2zaRpu9P/e7Nv3jK24
         JXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712639621; x=1713244421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6G7fQwZrU8Ut2ONWgYwB5iUHvGBDAPNe+jjAW2C4Mg=;
        b=fRzpn5hoVLZT9NizrXwUacVWEqJG78RpEO/zR8KAJdfQq9oGfUdfb1T2mckobF87BC
         IaXmZyjlHQdL5qF5eyE0GQ8/XKgust/MHupYfBSyB+5CDB6qKoklkTwp9vVyW3kq60xK
         kid9bXBXWWIL+gZVEgoMQv5AZa+F3cUyJpdt9Dq0EXaYfzZ9y+KHPa0mhvDcv1AN03Il
         tvMejqiTvzIfMXCbbMF8rp0r68d7BqgSwAjfFcXwSIn3a9VvOF71NopTSOlOJx2BN76O
         1zvMS8AB+ddZvGlndyFonCQGMB2eIwmZcMwkdFIxI49djf53mWHIhJCU88IIhTX5LHFe
         2iWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4hbk0t047uF55fzJT3h4wmsoF+0i01IQOhH4/wLK1Inly6FLs9e7eayKWd32jCW0YITEF+PRSOxWSKU0Kxd+Dzzp
X-Gm-Message-State: AOJu0Yy2vtwd7wgDwPK1CPm2ZLDTRBdsJV2jbfo10aKiDxJBOTuFcLP6
	4GKYb6Cg7sePmcZXQixjbfW8lf/j68xGIWHOdxbglaiJOvjU2WD70mRsBZioaHtYZrrQ9ltOyl+
	a40XMBmiAYgaTT672H3UNhU+YBYHFto6gkt8ma0b8PpPiDjc2tA==
X-Google-Smtp-Source: AGHT+IGtzSNJgjDc/nC7nFe1GhF37b1NuM2JGv6SOuE597isSLhoxrccb1PNcX9sCRP+cNte/jpd8sOR+EPxlmcj0Y8=
X-Received: by 2002:a05:622a:1f9b:b0:431:6155:c602 with SMTP id
 cb27-20020a05622a1f9b00b004316155c602mr124400qtb.3.1712639621316; Mon, 08 Apr
 2024 22:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231310.325451-1-saravanak@google.com> <20240408231310.325451-3-saravanak@google.com>
 <CAGETcx8gGcq01CwTZyn=Q0fSQkzMf6tshSmPr5YWYZuhhJVdXg@mail.gmail.com>
In-Reply-To: <CAGETcx8gGcq01CwTZyn=Q0fSQkzMf6tshSmPr5YWYZuhhJVdXg@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 8 Apr 2024 22:13:01 -0700
Message-ID: <CAGETcx8j50dpovO-Mj0MjpYcw+n6T9ei6mo8tm7BVkcjfy_VVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] of: dynamic: Fix probing of overlay devices
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 6:40=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> On Mon, Apr 8, 2024 at 4:13=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
> >
> > Get fw_devlink to work well with overlay devices.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/base/core.c    | 10 ++++++++++
> >  drivers/of/dynamic.c   |  8 ++++++++
> >  include/linux/fwnode.h |  2 ++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 5f4e03336e68..d856f9c5d601 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -237,6 +237,16 @@ static void __fw_devlink_pickup_dangling_consumers=
(struct fwnode_handle *fwnode,
> >                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
> >  }
> >
> > +
> > +void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
> > +                                                struct fwnode_handle *=
parent)
> > +{
> > +       mutex_lock(&fwnode_link_lock);
> > +       __fw_devlink_pickup_dangling_consumers(child, parent);
> > +       __fw_devlink_link_to_consumers(parent->dev);
> > +       mutex_unlock(&fwnode_link_lock);
> > +}
> > +
> >  static DEFINE_MUTEX(device_links_lock);
> >  DEFINE_STATIC_SRCU(device_links_srcu);
> >
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 19a1a38554f2..0a936f46820e 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -237,6 +237,7 @@ static void __of_attach_node(struct device_node *np=
)
> >  int of_attach_node(struct device_node *np)
> >  {
> >         struct of_reconfig_data rd;
> > +       struct fwnode_handle *fwnode, *parent;
> >
> >         memset(&rd, 0, sizeof(rd));
> >         rd.dn =3D np;
> > @@ -246,6 +247,13 @@ int of_attach_node(struct device_node *np)
> >         mutex_unlock(&of_mutex);
> >
> >         of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
> > +       fwnode =3D of_fwnode_handle(np);
> > +       fwnode_for_each_parent_node(fwnode, parent)
> > +               if (parent->dev) {
> > +                       fw_devlink_pickup_dangling_consumers(fwnode, pa=
rent);
> > +                       fwnode_handle_put(parent);
> > +                       break;
> > +               }
>
> I'm clearly calling this in the wrong location. Please move this logic
> to __of_changeset_entry_notify() and for the case
> OF_RECONFIG_ATTACH_NODE. Haven't fully thought through the DETACH
> case, but it should work correctly for that case too. If not, I'll
> take care of that next.
>

I'll send out a RFC v2 with the code fixed up in a few minutes.

> -Saravana
>
> >
> >         return 0;
> >  }
> > diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> > index 0d79070c5a70..4b3f697a90e8 100644
> > --- a/include/linux/fwnode.h
> > +++ b/include/linux/fwnode.h
> > @@ -220,6 +220,8 @@ int fwnode_link_add(struct fwnode_handle *con, stru=
ct fwnode_handle *sup,
> >                     u8 flags);
> >  void fwnode_links_purge(struct fwnode_handle *fwnode);
> >  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
> > +void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
> > +                                         struct fwnode_handle *parent)=
;
> >  bool fw_devlink_is_strict(void);
> >
> >  #endif
> > --
> > 2.44.0.478.gd926399ef9-goog
> >
