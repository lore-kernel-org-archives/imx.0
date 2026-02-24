Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A93A0B25
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945035; cv=none; b=ADKqIzBYcutJPVU0ybYivtms57/jB2idrQufqoXAQONMpbwF7a7HA6e6sqpjAwsXhoTu6jDRBLNT7mrWhYY3bSdDKXLq0qjhJMWzy3xlkOKX5P/V55al589xU5kyunredfI9O/rDhG0+DdOSpaDkE6DlKOSYcYPpHKKsVrgsdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945035; c=relaxed/simple;
	bh=SmcFYV/qj7UP3TQzOKySjVXD+r5cVR7LQGNmNUdtKn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIinJesuv2NjkagT/7zZlA7Oh6Cq2W0Elj1L8wWr1f5pwj8QPRjOrHpGFYFHdKrkHXpgWE1oHK1xEIvF5QSKXPiHVFhkylvQfZIEchu6rj4n+m1Mus7+cP55I1bhvS1ZB3V5rqLA9ETtXfaSCzLcYwBqgVxZuNJ8Az6ro2SYoxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpDOjS71; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpDOjS71"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso49313725e9.3
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771945033; x=1772549833; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKZebIKg4zGvAmOtTA5PkRD7pA7GxWbSjVAl6yAokyw=;
        b=SpDOjS71bgW5+hAMPSUgv7Xg3mdLvwRBgESXGAtTHtE6Vw6JGZMvI2Fl5z737tLUJU
         06vUSpsMog6+fYndnotjSPL/svzSBgaNxkx6OfH2qmY4ZQFFwNNgDtdyGv+lX01UtDu2
         q4qo6V4mqbCyoYIN2+juoQMxRWPXUs4gjRZhL+6oSQYHxf1zn22tBIX7YEPcz33Z1vAa
         nT226U+0uE0hv3u5DBhNv6zOCkxJO94rprePX/V9BpOaKh37hJEvX/JEYgUuLsMKS69z
         OnuAV3WkRFsWxvSXCqXeseazAL6sKg3HJ8KW7wWvtqykq0j60ROQLc79XotR54RIn5q3
         FEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771945033; x=1772549833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZebIKg4zGvAmOtTA5PkRD7pA7GxWbSjVAl6yAokyw=;
        b=jublE8EFe+7iBc7nTwxs1142fUcfEV4fXuBm3IWjfkbbAVb8OkYe8leQQMVggscd+O
         XR7GhT3Pa7cGvALvVbXlj9gCbAcMZutlbAuEgkpdQLLfFEpU80DtIhuqZD8PqbsBkj8Q
         rf6EqmN2wO44ArBW2ZdEi8C8/bqQOK8Hif7tG447D05HDRGdkfIv0PX3/iBySdMJ4MVS
         WhwPAv6fc5gA+yBwgLFP0XboCnPLPU6oMe5pWrnvDLIRG0xlSr5U81DDHp9r+dWm71E0
         GdkrBi1OupiJmVLvujEnz33VgWJq7Z+WyW9KNrt92wxf9PBVNLQlC2JV26+T7V5rHlAx
         a6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSLXqNoH40sVlLEPlaVestmO+h9nIdW+N6+sWWEHypuzrNS+Sh+4XSM7uu9X0+tihH3gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwccFuvCWitJumenV/RnyXkTqssEbgu21K3tVp7r+6zZykBdhJz
	xmijIjSuwuunIH2z6jAUXH8iCDmFdwz+3C7uhaP1W3eQNibYyGBQfxAwNf+JNA==
X-Gm-Gg: AZuq6aJchSiWs4jLdSnTaI6gnCDdybV2bEdLqjT7tPTTHNw7JDNJNUd3pyAaJJgqnd6
	4tHwN7Xiv5VXAKXvmCYnKlNkZ+PBqFPBodjMHqMiE49SbS+qxaqyy1mFr+Ozutw2ixQcK5apeXq
	3/KLTPNwYea5zyha8W23lN53M3Grrd3B2HnCxW9iGoHAHIaXM2Qs/ClXL4bT+kzF9wp9Yq07p2J
	XeGAsuhylA6Q81FLJIA+TwJPHD96XhphyWujfaqgfGE3bkG2ZyyLM2EqkhJQFh9ILK2nTqBlbv4
	WPYX74E5yTRUpXof/YSbgbED95NK5rGMCHd9LXRPxPqQDUgy6w70LEfdkb6gZyilXrJ1uVuBptl
	CmgFwKWIiFPhkm095qnYDryol3ToLs+PhAzRcVl4iTh6LypeXMpAzA/YvFSKTZuY7aqQr3dBzRJ
	obj6NVRPMIsFZzHh+JNdXblcJRLbqNfTvKOif5aIO7b9Rqvgp0HzWyrUmYzKZfumPEFGF9wcfZK
	EyojAcDrOqixVLrWBBBfXvv8Al3j49jIZ5SrXYUKvvDWhs=
X-Received: by 2002:a05:600c:6217:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-483a95eb550mr188993945e9.3.1771945032693;
        Tue, 24 Feb 2026 06:57:12 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b820def3sm50829565e9.2.2026.02.24.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:57:12 -0800 (PST)
Date: Tue, 24 Feb 2026 15:57:10 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZ28RtuAWcatyVAf@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZX0WB_6qPoCYVvC@Lord-Beerus.station>

Hello everyone,

On Wed, Feb 18, 2026 at 06:18:16PM +0100, Stefano Radaelli wrote:
> Hi Frank,
> 
> On Wed, Feb 18, 2026 at 11:35:23AM -0500, Frank Li wrote:
> > On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> > > Hi Fabio!
> > >
> > > On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> > > >
> > > > What about users who still have boards with the Broadcom Wi-Fi chip?
> > > >
> > > > Will Wifi on the old boards stop working?
> > >
> > > The Broadcom-based WiFi module was used on earlier revisions of the
> > > VAR-SOM-MX8MM. That hardware revision is no longer in production and
> > > is not available for new orders. All currently manufactured and shipped
> > > VAR-SOM-MX8MM modules integrate the NXP IW61x instead.
> > 
> > This common problem, we met similar case. After replace new compenent, it
> > should be new boards, or new revision.
> > 
> > I don't suggest directly replace it to broken old one. You can create dt
> > overlay files for new boards.
> > 
> > Krzysztof Kozlowski:
> > 	how about other vendor handle similar case? Any guide line for
> > that?
> > 
> > Frank
> > 
> 
> Thanks for the feedback!
> 
> We understand the concern about potential regressions on older SOM
> revisions. However, since the wireless module is soldered on the SOM
> and not configurable, we are aligning the upstream device tree with
> the hardware revision that is currently in production.
> 
> This change also aligns the i.MX8MM VAR-SOM with other VAR-SOM
> platforms already present in mainline (e.g. i.MX8MP, i.MX93), which
> use the IW61x wireless module as well. The intention is to keep the
> VAR-SOM family consistent in mainline with the hardware that is
> actively produced.
> 
> If there is a strong requirement to preserve an explicit description
> of the older Broadcom-based revision in mainline, we can evaluate
> adding a separate description.
> 
> Best regards,
> Stefano

Do you have any update about this topic?

Thank you a lot,
Best Regards,
Stefano
