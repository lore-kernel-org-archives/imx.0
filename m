Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011B4F20E
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712626852; cv=none; b=l2UWNR6UtWE/wulp7eefyibvsueFQHtSRo469Yecshyu7tKGCEiN8KLHICnJPltExPnYxHw9/1LldzpsIs0SdK7Zt9abODZi8Hk3avMWJ7IUqwl0uYUIiwa3jC+lM8iPX3r12dHobS0NuJb3C3MZjFKcMHDVmVulVaFjP+ZhSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712626852; c=relaxed/simple;
	bh=r2zmZTpMnwocl++95x/nU/XIUjtwCpHeymDjMVB47PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzwiuagqefLD0NuGJrd+VtKxG5tzuJpA0RClXda74PB88I88dh5uOHYP4CDzDYVx3IT09/PIX33Z0xy7Dd8+M5mq7jKRteMU9v6dfgjpYq9c+VK6yD2wRDEO0vi6Hn3XNdravtTwexqKfbSu6AIIMgor+CtQyL3VWKG0fwxbiPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AUCFoXBO; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AUCFoXBO"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-434b5abbb0dso146181cf.0
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712626849; x=1713231649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMxjAHL/FWsCSnB+XuEJfb4SXECUjGEArxNQA5omnzs=;
        b=AUCFoXBOUZUwX+KPkBIGiI/L8onbjBTv1XQ6WhyrDANM1qv9qQ+6+1t0U17bG31s9t
         rvS/XcAlyXPJ+GhbwPBJTWHOs2tx+qEScJL29jcxoRTLus72DqXFPOhbhLlwIK127pI1
         wVypbYzpo8nwriKgVK8GoLp4QnKzXIT1o2PucmXZJV/GkYHJPGRdqlGczAraWLgKxxc6
         L5vhWo9Ldm2kA2Mzk3rZnXX5SzDkdtGCaMmKijwJc/jXDIBluyCjoQAZW6fYmdD72kwG
         1aXdHqGfYLTGS8rEsNKQVFHZ0j5rBxqshU6dx+JcGOVE1+O2+zrW/IYDqSC715dnLIGR
         RIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712626849; x=1713231649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMxjAHL/FWsCSnB+XuEJfb4SXECUjGEArxNQA5omnzs=;
        b=reQeA3zOmA1a/7v22ol+KwJNdanYX5Nccvh91CkV5mf4m8j6IeDq4QWaKAoZpM1pga
         mwKwxO+ezjGbDTu0YT7nqXud6mLKNbD/dJs3ONOPhlz9FrnEmU4Ym8ShI+9VXjuKantU
         sBckP6z0qvhhUYM85Nt7pmfJVnc3A1aOX0uXWa5QpdAea35dfCKvZ4omrswtFzkufEbA
         Q+3JrhpYnPcmtDs+uDN7GDCKeQBV/PhynZifm3PzkLoHP6kegvtR7WZpt2PIsiZr3mOQ
         hsrsITEneLo3+dxAzjRR2qCtMgDPoshwTSnMVa0JPGTHoEZ/kK84bIsvcAA6zlESnwIy
         eT7w==
X-Forwarded-Encrypted: i=1; AJvYcCVp6ElnpulfG5LT0z+ryFlO3y0Ehj3PlTN88+POyGidDUVwcUWRoaiwHqXdGv70qWLYZDcXU5dt3DByBMG47VqA3M4/
X-Gm-Message-State: AOJu0YzLhXGDpS4RKsw7HG8ysso/MtJi7HXfJbeZZ4Lj+9DnwYazgagN
	OGDo0fi0unXwUOuLiYf3sROzOE6sved0ntqMZzAyFs+jonwgiTewcN6UvnKW3EZzkt083lb+kKI
	xpwQIP6wNZkPjRZESrs7VdmXIACV0CH2SemWx
X-Google-Smtp-Source: AGHT+IEfHMMkArtxOzJrm3HH4hiDp/NoiyU+a1zFBYZHw0wqk3suYz8SBSxh/O4d272loLH12QwJvlO1jB0eckScQqE=
X-Received: by 2002:a05:622a:4249:b0:432:b544:c38c with SMTP id
 cq9-20020a05622a424900b00432b544c38cmr74945qtb.21.1712626849300; Mon, 08 Apr
 2024 18:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408231310.325451-1-saravanak@google.com> <20240408231310.325451-3-saravanak@google.com>
In-Reply-To: <20240408231310.325451-3-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 8 Apr 2024 18:40:11 -0700
Message-ID: <CAGETcx8gGcq01CwTZyn=Q0fSQkzMf6tshSmPr5YWYZuhhJVdXg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] of: dynamic: Fix probing of overlay devices
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 4:13=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> Get fw_devlink to work well with overlay devices.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c    | 10 ++++++++++
>  drivers/of/dynamic.c   |  8 ++++++++
>  include/linux/fwnode.h |  2 ++
>  3 files changed, 20 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 5f4e03336e68..d856f9c5d601 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -237,6 +237,16 @@ static void __fw_devlink_pickup_dangling_consumers(s=
truct fwnode_handle *fwnode,
>                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
>  }
>
> +
> +void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
> +                                                struct fwnode_handle *pa=
rent)
> +{
> +       mutex_lock(&fwnode_link_lock);
> +       __fw_devlink_pickup_dangling_consumers(child, parent);
> +       __fw_devlink_link_to_consumers(parent->dev);
> +       mutex_unlock(&fwnode_link_lock);
> +}
> +
>  static DEFINE_MUTEX(device_links_lock);
>  DEFINE_STATIC_SRCU(device_links_srcu);
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 19a1a38554f2..0a936f46820e 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -237,6 +237,7 @@ static void __of_attach_node(struct device_node *np)
>  int of_attach_node(struct device_node *np)
>  {
>         struct of_reconfig_data rd;
> +       struct fwnode_handle *fwnode, *parent;
>
>         memset(&rd, 0, sizeof(rd));
>         rd.dn =3D np;
> @@ -246,6 +247,13 @@ int of_attach_node(struct device_node *np)
>         mutex_unlock(&of_mutex);
>
>         of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
> +       fwnode =3D of_fwnode_handle(np);
> +       fwnode_for_each_parent_node(fwnode, parent)
> +               if (parent->dev) {
> +                       fw_devlink_pickup_dangling_consumers(fwnode, pare=
nt);
> +                       fwnode_handle_put(parent);
> +                       break;
> +               }

I'm clearly calling this in the wrong location. Please move this logic
to __of_changeset_entry_notify() and for the case
OF_RECONFIG_ATTACH_NODE. Haven't fully thought through the DETACH
case, but it should work correctly for that case too. If not, I'll
take care of that next.

-Saravana

>
>         return 0;
>  }
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index 0d79070c5a70..4b3f697a90e8 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -220,6 +220,8 @@ int fwnode_link_add(struct fwnode_handle *con, struct=
 fwnode_handle *sup,
>                     u8 flags);
>  void fwnode_links_purge(struct fwnode_handle *fwnode);
>  void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
> +void fw_devlink_pickup_dangling_consumers(struct fwnode_handle *child,
> +                                         struct fwnode_handle *parent);
>  bool fw_devlink_is_strict(void);
>
>  #endif
> --
> 2.44.0.478.gd926399ef9-goog
>
