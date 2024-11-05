Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D21D9A60
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828012; cv=none; b=AGTy538E3O8rlIjlbFpYoSLSPj4KPON3OgxaUBSsO4ZD/ytdGuWpiCQHdMkYC86NgbUv4wWIeiXYJKk2Mb+PfGykVPHOQfdONxL3577TgulH4tTi9pH/nmshxdI74kqu8LKXJ60XP7DNadhzLwz3HH7KyyFGShMcTqesJPOwmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828012; c=relaxed/simple;
	bh=5p5IeNeTEKhL8Xp6W+OqdaIXLw2VE5PGJNso+vOelo0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VtnoU/rlyY7TbKJdyGEbxobgW6PG1zdVtmb8hQp28+KhHIu+ECzbpS/nESneZtAicmtKR3U56kVRtRpPuQwVerhu0vbLs38UKCtzOUB18Y3YKuN+ekVwXcT67PYm72FaP0hggtg8WQNXGFni/QIN1cFeZCz9cirWlxfssIV3JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JChUPoA+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JChUPoA+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so5649800e87.3
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730828009; x=1731432809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
        b=JChUPoA+MjlGZ1IR7jQ7H6CpaiuKBHw04i0LoNNa+nYuBzauIbSyNXnlEu0oaSMSXO
         XfSlOeeOaQmIi+UWmkuiy08iUanSX+IDdtSEDH7yv50IkcRfginj6/dQvruwha5c8Voe
         epicCtlXFcH7fn87G6P/KKuZbXnJA5St01xlQ36ej2RZ9RFJUo5BDqSGafIHTfGcGEuS
         MHXhF9FVmnYxUpL2f8rsqxCQ0N/5aEDLV/BwcTKbZxw1iLpRTUXtoeAUgzbGL/0ETNCz
         LxwhWcXcyDPjHO3UGRaHfSaXOKTgqf4obvymUZKbh9aJJ4TmpLrQ/8wIrer704h8QHNN
         eQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828009; x=1731432809;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL1RRdJvbyow0/4Gx8okr/VQzPzKmrgzOSUtxcyZLw0=;
        b=d0Utpvp+VUTmBXCxFbtgkeOIxlfMa8PUzHLu/4l2PeKu26EtTK+mEPIMH1sUvEIjBH
         rFqkAskDtwP4v35Cfx7HCVB6d1V15Emrb7xLaSC2pDZLhMg7dCRavnLuLYqCjid4ttGJ
         dJVFoX8X0M3cXDw8PPI1sBX0+FBav2c4eKVUyDK4TKvtISvIUjSRki/znD+MgBIbiuim
         jd2TBJmbmiIjJDogyU1QhRAR/2FerA3ynDbu2xnftH5fRDzK6K3PlmEjl1dETuw7UGhW
         p+zNGn1WG4DW1s8ZwdLm7DjedpIamFbPyi88iBZONfr6VGJqUvPiOsZb4dBwt1QkJ92Z
         IjNA==
X-Forwarded-Encrypted: i=1; AJvYcCW1pUAStG0GufDZ7uCbsKQHuiKetDCce48fx1OPpMToVtZfLK3CDppthpG3XtomaQddL44=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWYPH2cRaKGCjTRs5rp/Pu+kmcKs80myrAZZzMV967KVxdNUGJ
	ojeMZpr8R80ykcwb1Huw+AjkxcqDBkkjwNwvT4NKM+owaAKd9c5Be19LF3rPjp0=
X-Google-Smtp-Source: AGHT+IGi18Sva7NE2bGd9ATSS1dZp0tYBcKab71BKwIRnXTz0bTETPbOkVUJ2V8gRDOK6fT7ixUiNA==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr19326836e87.38.1730828007874;
        Tue, 05 Nov 2024 09:33:27 -0800 (PST)
Received: from [127.0.0.1] (85-76-138-48-nat.elisa-mobile.fi. [85.76.138.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbc3csm2221064e87.193.2024.11.05.09.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 09:33:26 -0800 (PST)
Date: Tue, 05 Nov 2024 17:33:21 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: =?US-ASCII?Q?Re=3A_=28subset=29_=5BPATCH_v5_00/13=5D_Add_ITE?=
 =?US-ASCII?Q?_IT6263_LVDS_to_HDMI_converter_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com> <173080602214.231309.12977765173766280536.b4-ty@linaro.org> <20241105-secret-seriema-of-anger-7acfdf@houat>
Message-ID: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a transmi=
tter,
>> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> > function=2E  IT6263 product link can be found at [1]=2E
>> >=20
>> > Patch 1 is a preparation patch to allow display mode of an existing
>> > panel to pass the added mode validation logic in patch 3=2E
>> >=20
>> > [=2E=2E=2E]
>>=20
>> Applied to drm-misc-next, thanks!
>>=20
>> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>
>Where's the immutable branch Laurent asked for?

The patch set has been picked up after getting an Ack from Sakari, before =
Laurent's email=2E I am sorry if I rushed it in=2E


>
>Maxime

