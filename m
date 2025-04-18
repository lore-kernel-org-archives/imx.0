Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF9213259
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977723; cv=none; b=iRansbrDFLmYyAZB5ed4j7WvP8pLFcZlvJUFJOTN7yfCR8eHRCFOSYuT3teLpgM6hXM9gaefnucFznGjU+p70Wmequ1jYJ60TH8924rvjc6100xR6Ct4Zw1CCGsrwUXJPbZl1zy+Omgqn/iBI3CQBFQYt/eTQdyC17rqGrDr86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977723; c=relaxed/simple;
	bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/jiuUWkVoQFJLPMngKMpVnzkuv3TGVPS9DOOWzgSTU6sBe7IeAJpo7KP0h4FTVbciNqKEGpRUm0OU/7FfSm/AKyqIHB0HjrVGSj8RQf5pPrYiI2lE0ZiksW1B3VUljs5x0DDxzbuDmfQA/Bj0Fv/YlyDz0+DH8Qkq5wNabAEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=W480/To/; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="W480/To/"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72ecb4d9a10so1050116a34.3
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744977721; x=1745582521; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=W480/To/cssE3zRLHT1G0BX8w7sjjcvUussC1T4ywksnJOCf/IEBu5fC5qFVZakKNo
         KYX6vnbC/vItpVCTUgyv5Kc6FWu4glNA7Bfml8jiqG4iZe073PtnY4jHpl92wENwBhTk
         5B+n7fgfkg7I5MXDEcyk0qqI14KiYudAO/lsXFSrMGQbwffKvGFhT/2bxlTZ8X1MD/DZ
         ybinXRXiuiInSFVnANSmMcQ6O59lnaL8BSJyUvr3ifmPN0mrojxXdpGsZYUG4FfTYbvR
         4eHpiMdWssT1kme1S/G3osJK8x224UbHZOrmUNfCDT803SMO2rRn3yEbNfKbVIYr2h1J
         h63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977721; x=1745582521;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=EqjxGv+eV5A6vG5hzIk5tpkjT0ZUU+c4UYe9gMNqherWp+82d9WDt1OY0lWzBMivx6
         XI0en8oM6tq1AS4K0OUauBgchGlbR/zQjPD3OkrRhe6zob4n2DKH+32ofeik9lqoF+wL
         kTjEqmkb0U7yqGHrB7TPLaEisywuAjQN20gObL8AVoJakYgmDynxrdJRD/VrKvQrB6pX
         Nkfymg6BWAA/5LavhNNMCjoUCE8SpUnJWM/XmRHu51YiLY5KgeL2Vi77BCZnKHeYKgxQ
         wUolyGH5xfbONcTsoJoS2lRDKQx4Z16XQnUuuWogFjg+LkNeMxwgX8LZaHZhH4e+Qr8s
         mAQA==
X-Forwarded-Encrypted: i=1; AJvYcCVOkqt801V6ls6RPirY6d5SHwCpkbkVJQ7rlJS7zoJp0prNSUGSCTe/IOHvP/RGxMT+uRY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr1etkwT1h3mbBOHdb7D4ct5RTDl6OKjKrXbjoQIDJzmMYuwSt
	tE3Dmx/xsIhbsdxov7SVYHn3XPoR0Gu8hDMwErlotWrun0bmmfrJYPZiUtAg8yo=
X-Gm-Gg: ASbGncvi3STUdac0zVxvh67vRXPTgDV8bVuQFzjnyTE0qcsk+tFZIptk838dYmLvZBW
	LqQG4n7YbbNh2+uvSn/h57L5/k+XDRx0EfOI3gQ+t7GOpykEfb4vdzLxYwHscf99CayZfzXwnxQ
	/4R0be4N6Q+I392KRAXw3gyhP5nl2WsWnNPLDujsT84s7oPjOMsHCZqS7M+M2BZDtdosbnVzzdV
	Te2zo/tYEg3EfiEZyF6P7WHKKcEXIuhPT0tC3BXhLoiU3YGqwTeeVG6HbGRZlFRjHXotvhbu3xt
	wYLFikVrJOEW/V/bwjgkqa4K7wA6EFmBqXkxl8c9c1bjXQ==
X-Google-Smtp-Source: AGHT+IFpmEodtbmgdnihqC7sA3nbhK11fYL7TMUIM5m+Rg8CrSkqO37M6jThPDqqOLUcCHvHUJZ9KA==
X-Received: by 2002:a05:6808:8019:b0:401:16e:b8c1 with SMTP id 5614622812f47-401c0a9794cmr981088b6e.15.1744977721359;
        Fri, 18 Apr 2025 05:02:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b324e2sm9870316d6.61.2025.04.18.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:02:00 -0700 (PDT)
Message-ID: <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
Subject: Re: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:01:59 -0400
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Ming,

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>=20
> But there is some hardware limitation in the repeat mode, that may cause
> corruption or decoding timeout.
>=20
> Try to make workaround for these limitation in this patchset.

You should maintain a changelog in your cover letter, this way we know
what has been fixed. You may be interested with "b4" tool, with "b4
prep" and "b4 send" the tool will assist you in doing the right thing.

More details on what is missing:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#resp=
ond-to-review-comments

Meanwhile, just reply to this message with the missing information.

regards,
Nicolas

>=20
> Ming Qian (5):
> =C2=A0 media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
> =C2=A0 media: imx-jpeg: Reset slot data pointers when free data
> =C2=A0 media: imx-jpeg: Cleanup after an allocation error
> =C2=A0 media: imx-jpeg: Change the pattern size to 128x64
> =C2=A0 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 120 =
+++++++++++++-----
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A03 files changed, 97 insertions(+), 29 deletions(-)
