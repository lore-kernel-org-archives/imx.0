Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B81F1315
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762289068; cv=none; b=ksROOeFD5myxEznpF5Xvrds6VfiJ7JA35/vC6rqiOL+c7s/TFsI+eJqUiLawwYXAanT3zbrbaP89shkQplwz1N+IaHeuoS0OrozhVezAQMw2T8M0AVdhgClahIchb2RTawEdpvNLBkH54BJ2xHFiw90ZKtvQyWvv3DnyaDRDSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762289068; c=relaxed/simple;
	bh=GKbKLrx8KAYUI0LS8udrzqIkqtR4H19YIDzb4FUMMWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdGtyFVRqZNxJ69BgtcQxn2fUwXEHWYhnpQjQwobKVsRV1MZtq2dO8FhDOq/71yXO5eT8jjq95i9YIDTSPkk03ApEGHcVKBmGVYEM3jK1N5UihpILYvtuX+wFgD1jKcdbXai9HH0gLBSU1VNa+8OT3zrMkzGlszG6IrQOvxSYdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcXw/sTZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcXw/sTZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d1d6442so254210e87.0
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762289065; x=1762893865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
        b=lcXw/sTZbG0WiEK15l6TJD0zOs5GQIRxSmrKQJ5ebCP8Wl/oNIse0qsCeGCUdtrjM3
         4aF5yfXptAtXFCLTNqS/PmNMVa1omQ1lnTzydN/zZifY/I5F0LdptZc0yf82V5vIN+CT
         1QiTQYT76oa4KXRtgjnzfocZ9YpsVmZB48sghvJUM2Na4Rq6i1wBnG0jHMKjzTKAA/+v
         Fq+dwS0b/6u3OtCByA571edDGwP9wNEEeQrViHb+J7hKf5ufM5p6WzyhHlznaw9hQwgb
         Tbu0F7yZuW02pPYepTBA/uFfTFiZWyYjzWcCHvPLuFsAFQbIPJZCm5XxaNYb/GWzHXKe
         C2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762289065; x=1762893865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
        b=Ig6sSvHV8loMUDx5CFhiYmoSoL62ufhtiyXJ8nin4vnEGf7ihS8Zu+s+ZPuZkGObEW
         7fOaJ7VS77gtkccLiFHSG7FJ5PLJkeYqouEvO65LfcV1mlkasiTy+n0IGjYRYZm5tkV4
         4Z2fBvVuqJrK9LDfI9qQpmuBkVwFlKgftmGK4fXc+WbbBvvwrOEnQ4G3//HoZ3gQDzQ/
         aaAfgVMqAvI54pA67zobUYX9yCMgmoBJq2HyaVneNjxGjU7co9P5yYPCXStdAdp6dJ3s
         NkeQ2i3AgtJfYB1szg3qL5QW3bGbWTseZUllIbEq1uRYnmzmRGHabFNMvC2KXxtfgrRu
         Y+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/98Zj7IVSQa5gOkoHI0Idue51zNi7K88w29GuLci1/WdseF4ozIGsQGkH9YYrNr/ZGYY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJpiyedYul/hgxHaUryK2K9UoPsC2uZJDbKReCojqrc7OpQj1
	InSV18Iyd86dN6P36kgs0Pt38rfTcP3lr3tRp7fcpbe/f/7G4cEpd2P/RS9u46C7rvHAelrcbpB
	XgycxJg5m+176ulApvYr73mpXGeA1N3o=
X-Gm-Gg: ASbGncv5yuZPiDO6no4C82EQHyt5yOI/FePh4NaWTb1RcGbF2XNc7lnChB7O4wMQkm3
	2BLEPz7tRJMunFksUDIYx+3m+DlCHs43/LffBF45N+vlYTKTBQifut2SN05AaNk6SrqI1V5dwTh
	cAZnXWIGC0KCUWaXso4Uzq6QpuCl6vgJxJUGIhKf201GZYkjHeZUoZ/nBdoJYupsA+7ECinF2HC
	C5TwOujnrrSJCBgUnxYFD8bDqpqYz8cwiJcVY/lDbFcULJzFj1s62j8U5cq6mJXNh9KvScRPSUj
	8RNU8Kf9bX2eFlol
X-Google-Smtp-Source: AGHT+IEgyDz6GgQ36aOhYZfcy+M9mJYKbg+MSqwHomwdqA+8oevBdUI0GcxGO3WedYpy3mCE8otuQ+c7+LgGwJyJeBc=
X-Received: by 2002:a05:6512:114f:b0:594:3c08:4f05 with SMTP id
 2adb3069b0e04-5943d74dd99mr147323e87.14.1762289064896; Tue, 04 Nov 2025
 12:44:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com> <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com> <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
In-Reply-To: <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Nov 2025 17:44:13 -0300
X-Gm-Features: AWmQ_bn9ScRQzwOew3nNnHj8C-mT5iCyP0mJjFFvOaLk_a5CcV4aEWSlDVa3aoE
Message-ID: <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: Liu Ying <victor.liu@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmad,

On Mon, Oct 20, 2025 at 11:53=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 10/20/2025, Fabio Estevam wrote:
> > Hi Liu,
>
> Hi Fabio,
>
> >
> > On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> w=
rote:
> >
> >> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX=
28 LCDIF
> >> because at least i.MX28 LCDIF has the version and debug{0,1,2} registe=
rs(at
> >> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.
> >
> > There are some DT users, such as Barebox that matches against
> > fsl,imx28-lcdif, so we cannot remove it.
>
> Hmmm, it looks like software projects like Barebox don't really follow th=
is DT
> binding.  Is it possible to fix Barebox to avoid changing this DT binding=
 by
> this patch?  I'm assuming that Uboot has already been fixed.

What do you think?

Thanks
