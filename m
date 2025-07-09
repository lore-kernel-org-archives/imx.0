Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C521A285
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065470; cv=none; b=li1SbJH2YcESSS52PcvPmlykq8JfINbwfaQMbH3N3bKhIkvM7z4+CtvdOkIJBlCToUhUDvp+mkn86ynHLqiUNRym4qp2BLFCmCWRUUn/vTmEcO6h6DFCSVQRBLYvOHuR2tWO4xicg9FhPZpsesbdvbD8QgAKLTJ06uPt5FRHcYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065470; c=relaxed/simple;
	bh=bS30qzBKG0kk8EMi8ZpiEEOGC81mI51mpXsSY+KeUbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQH1gtzhmFj6BqXTLjSSNkTtPaisbGW1dwWRCSzGzQjWarhVqtdrtbmWt+4B59RXyjLOTeLMDL5yNSs8es6Nl/G8JHYhfr+OXeP64QqqqmDFd3ffV0mMlRm/UH1ORySwSgFC5b/AKkBBtQ4mu2sdMozVaUS1VKwj2iu62yxaS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cad6kJvk; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cad6kJvk"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so4468925a12.0
        for <imx@lists.linux.dev>; Wed, 09 Jul 2025 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752065468; x=1752670268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NyEhmSVIBICxuUIBvtGawGc4Iwp2NdQOe0bbugc22A=;
        b=Cad6kJvk3bcxRg0gLbHx3jfLGrW+wiDmQgicXV4+d/hLHV6DX3Udbs54HuGapnQV30
         2blk6O1eHI4umUt5zpM1kHhayVTkMuHPlW0OAHPESwNQKDWtHw8injxNd5JT3iAFVDCK
         nL1yLto30zHc47MPOn42GEgLV3VuBn4p17HlxN82xqxForNKS28FR4s6jg1cm1Obklt7
         lpqay/qcoEI8shWGmDo4XURdgZPnJVYhSD+9n/PvR0yFhWwibGrIH4LwdEgULngH66QS
         p+7dW0eN5JbY5ZnBsGJbUwFwy20KsmOoD/tDWlcMsxg/T/sVNDay6AZTRBM/tTVOtZym
         XvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752065468; x=1752670268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NyEhmSVIBICxuUIBvtGawGc4Iwp2NdQOe0bbugc22A=;
        b=pbqVhW8tSRCMrT15BW3RzIrvXbgRzws7hjGo8zOF+ZmcOW+6Ai8FpvKeg24qG8jj7L
         kJnZY58WXJSD9D0q0CtyE4QbgDt92LvlOHoJJDYJHH9kkjSiL7l3TFvLpVRwnOR1JLPb
         Hjn5AYHV+FpHuArQhm2C+QPeGXXnCbIplmXwIsV2IdxIFmrpbJ3BW+gY8UrCXh4i+Ca5
         Rhce6mQyPKRVWpIfyS8w/6chFfXo1faqZA7TQq7MZulgs6b+lJMlc/GAbWe364aSjB33
         8xR6gmsfZXugI1R0HykzaM5ABQZGeeTJHlmj45C6VrZ7IaoWywom/wy2Ta9QD1LCOvWj
         Xy0g==
X-Gm-Message-State: AOJu0YyZRSu2aM/7ffEaDV4A20Z0tu1Kc3muhAco9Nf0RWTgM6JnlmV2
	3rkqAqubzzzU1eOoN3zcZbQnp2I+RlV+Ft9ueIN3Gi69oV8+l9osAl56UVU96igKPtBrQbFrRJr
	eZWwPoTjzhUn3cRv7N9jgJOmNDLkAJeY=
X-Gm-Gg: ASbGnctV71bK9s2wiTQ/yne0H+OHt3BD6VKZWMuCL3vej31Pl1wt4D69G9/7BGl+mhI
	5NAWYkMCp3lUb7obtn76QyWp4uu3Xdgod8FyZLELVKrdsQkfKVnYvf3D3eisknLfm6S8u/b4QUc
	1b0Oe9fyZpr5RAE9QluMGHu2irASeWHwW6/FwannTZ
X-Google-Smtp-Source: AGHT+IGH2nT6IZbDo+Ks/jODFk/vV/IDP2mO4EVK6jpwo5O0W2jmbx6OyQumL7TIFPqqenseGtE+uLTBc2Qz1uGxJ1U=
X-Received: by 2002:a17:90b:5247:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-31c2fdd1716mr3642904a91.26.1752065467724; Wed, 09 Jul 2025
 05:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com> <20250709122332.2874632-9-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250709122332.2874632-9-laurentiu.palcu@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 9 Jul 2025 15:53:10 +0300
X-Gm-Features: Ac12FXzjfnR6C_2CM5IgN-GnBOUmsZy0yzBqb-TNLTHux0vSrVzkSRKBepnd5vs
Message-ID: <CAEnQRZDY6vKwUTVuGqV7_DdV43doq=NRij6+zqJp9h1M5HgBig@mail.gmail.com>
Subject: Re: [PATCH 8/8] MAINTAINERS: Add entry for i.MX94 DCIF driver
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 3:26=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> The driver is part of DRM subsystem and is located in
> drivers/gpu/drm/imx/dcif.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8be3e0fbe72b8..fbec7e42e693b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18066,6 +18066,14 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:     drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 94 DCIF DRIVER
> +M:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +L:     dri-devel@lists.freedesktop.org

Please also add imx@lists.linux.dev
