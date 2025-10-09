Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7F2E092E
	for <imx@lists.linux.dev>; Thu,  9 Oct 2025 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014279; cv=none; b=ZJvUordSykrjyjDpiHlpeftxGvfP05VRSkgrq5cCckrfHczMzHwFfpLIWKXmcvvAKqD0DtXiFrttl1lozvkTEe510GqyjsoXOELF7xw2Cg87YBtflvEy+31DeLq1p4Zwjjb604ZolEuo880/PKcfrec8U/owWYrKMD8krv52mno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014279; c=relaxed/simple;
	bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aX/wkOgc3lvS26bDyMT5xcgL3+vP7yZ3SvOQfkZXvwD6SBDdm3iAXC3dEJhQPMbUTM0E4B0T4s+IFY7ljduWzPgkjmmYyKLoi1cUSZ2wVVDvGmv+HqJ5iIPIcEBfr/rWB62bOhDJApNFsJ8xy3lHKqRISC+zTuE54HRB3tJSLtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnQbst4Y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnQbst4Y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-271d1305ad7so14928505ad.2
        for <imx@lists.linux.dev>; Thu, 09 Oct 2025 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760014277; x=1760619077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=nnQbst4Y2nSbdvPlQeqM6dAmxjoN6pTvKvKlL998Oh/KMFZtZv39RWHgLVcycqcsLk
         oUCaR8roqs8bsE5FqKaoBdyKOMUPHt4ujXPSx793XHyrQ8w+YGUoq1ZhFAsc+Ho0WWpS
         MWaTviMqKziwkHiT4pNKKAWJYrzRN8KV4vsvoMWTwhm8V1Zurb0N/3jCS+WTmOMDLhcS
         jfzl2agH+fU6K4IgwKsgOWo4u1/urBz1wR8bCSAe+sWIcEqlDTVVUrpYA4S46W80Bb3Y
         PgaBYRu9QiJ+oNiWrjFMSsmQTJfx8JcZdZTjbvO6kajdCVXi8fNkQAaBEQYpZuLSBLlY
         bhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014277; x=1760619077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=Nu9AutbaXndVKjFPTw6p/Vz5BbNDtVheBfuesInDHbk40J/gpxQwF5Vv6d0I/yEDcS
         nL9Til+vtTvgN0toHxv5june4gOmj+w+drRhil8GwVMeSHO34dgEANiO1C8SqMPjniDM
         168+ZB9anB0E5auMKbboBmOTGdqlzk1w3nkAdqQCNPoQdOEV6Km1geeHXuO0wWbhrVgf
         jZblnyGayzl1IjnJPMDzYhheJsREx505ECLaA4Vcyt8/CJT1zVotp9TfawSqXg/pyzcB
         QqhApY6FleaCIoRhCXldMY0CsrNjZ5OfDBGljXlWdLzfKG77MndPOsbcRuXKsDGi4OY2
         z2zw==
X-Forwarded-Encrypted: i=1; AJvYcCXhgRBwoYHx8brvYBKKnnJyWHPcpd6vVSBRoGa2hcpnQLzLAUVdB+2nZXmy9v6VUGZfiXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi3yKvozwzNUv4fQ3Xkmhpt0QXeo5vfKeiXm5a8WqKltgUm6eB
	xnouhHokTDWwiUcxHwyCKj5DDO9T0WtTwIymXN24QtuaNryKYM6S5+qDcOqt67AzHtVdKTEzWh6
	Hsej1n+CYFlh7+fmYj2bRrK2FnDD4hgM=
X-Gm-Gg: ASbGncvZGuGynfKSOXm5Ogu/K66Yx3nJRtAqTHYX53x3jgz1On8mMroQ8wH2ru3jI6T
	QeVpMxU1wBmD3KUG0YkohLMa6u9rCIRxvw2Epdvg60JdYqs9KUVx7pgOPOP7j9HEgSlSXG+g9RE
	D31J68usnro2pBDz5ETW5aO4Mmp/RpvOu+CLhH08yxp7mx4mcAB9bIO1V2nmflA3Wjionw+T5/B
	rtwfNGA5BvTqPHvEe1Eari1ALr7oFB4W0RzOsQy/ta32vnhb5s5eX+xNWpe
X-Google-Smtp-Source: AGHT+IEhAV1wqwmuEfqj9eDPRuTr5xhy6QzH+Fe4j6lHSFhQoyHt9bJp9C/EYN1+uc18PLR1t+1Bf7rHPlE1k2VNj6E=
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id
 d9443c01a7336-2902741d0a7mr98644915ad.57.1760014276668; Thu, 09 Oct 2025
 05:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 Oct 2025 15:53:34 +0300
X-Gm-Features: AS18NWAD-sPW--RGZUkk020BQr_wBUAqvEISI-DaoXi4Qt_J4rUCZMsA_rvkqkw
Message-ID: <CAEnQRZCFk=07=tDgEPJeXx_xDp_6LGXi+2o9GAADoP86mWYZ2A@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 8:30=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

Tested-by: Daniel Baluta <daniel.baluta@nxp.com>
