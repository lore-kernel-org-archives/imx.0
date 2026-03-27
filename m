Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C932E6B8
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591615; cv=pass; b=oBdjwJA4JAXmxVm3vsOnQRNq1nzujEMLVUp9Ugv6w39CCXWaJFB2mWF9nfSLEFLSvT0e3G8QtXkshgSDSLV0RXakGSp8eonWRoykmARJ6PzhiYw8tl8tBF4acoXj4eLMEDP80pdtja7ZFIbtmnDwwGkyTsMD5swmqSFAl31xSXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591615; c=relaxed/simple;
	bh=1eCOhhP3pGCR0WGMrPsdTJQh0dsICP3YKEsNbw/PTPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o95q1WiJVmc8BtFnViaHTaU471wpDpMMCnw4W23FIYGs9dogTV+XhD/VWLyRG8n49lGRgzTNxs/2GIFHHUWnrk0hV5Vu29r5HAnDAT8/2TvUeWMij+/Kq+qeIjefJNqj1e3aRBNBPtXXsZzwIAQclh7glpLEEcRysR63n1peJSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eO/3vUBI; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO/3vUBI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35c206f0481so1429947a91.0
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 23:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774591613; cv=none;
        d=google.com; s=arc-20240605;
        b=cCuNSvmEAEeCm+JHmTZQWRudnYOJyIgLozSWVFfB38KgYBhXeAOyc+gdL2B6HCGaw6
         DvSzLXPcb7PA2P6BZJSwErzlcgcGXEz5dpBqr5CXnDNHnSdfOB/wepTReduRpvuXvxvj
         6cZV3DvyyV5AXMK3nfPA/E+bVtwLWtS8UiHOTAdr8VAkEdZ6wLp+OCOywDqi2JVzmB8b
         /9eMt9GjEHj/e5tmRMcW0lK/CluWZmkH54KBFlhzchHLzgdCz7IpXUc2t9Xfv0MjVBbm
         lDLA6qnMVbaUUsk7OTg2yAtiLuwn0Qyj7Qd5S2dEmOb0VP7x9vesuVtxgN98Zte+wyhQ
         E1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        fh=1+VLLNYWH6BqlwIxGgFlbAXMoUpeEj5x121AhnE9uD8=;
        b=GyfNd5P1aHdWbzuQYzB/n0M3XDcQDPeDl9dXvAYo2XPccWLV3Mmn4E4mhjmA2eYyFx
         6ghojMNjQlsXxlEKlYip8qL/vr240G1s4AIPKTTgB/K28sZlZ9IEh2PqHWp5uaK6oXk6
         vWAzb3FuesrNu71u54b3wh9PZRHqljKyphmVw9rvfKHjYazJDBZZIwKl/OAh47Lt3pry
         v6a5sJ55yAWG4E+LY2Tpblgni/WsM/OW7Uv737fdYmlEMa9s5Nyk1Go0eW6n2eUiZCKe
         lSi/2j3OU9aDsYswe9ndH8SopU3X8shGtswc9/LhDo9B6DwyfEgC4/TVktr2SxgPLFuw
         W3qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774591613; x=1775196413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=eO/3vUBIK0cu5zMEtuxA22/sWhrl25vFLLB4QMxBWXjdQj/ebVeDy9t8yIPERSixV+
         +KfKsggxZPQ2Jwhd8SBlntK3PWzcFpQf0gsruj+we+Pm3YdeN2QyZNAp2WCIhchYZBno
         wGlDAHeDyWLSBBMj6C5slr8VxlkxmB1sx8dP4NpTgwRAOyDx77EfP8C7Qq67fFbHTKes
         6wiVd8AeQYaS+5b/LMYSG3jjhjEW+SNnTuZWGwnHp5EyzOsrg7Ub+L0xQ+bFpaaFoNuR
         1zlqSB62hnznujJKlTOjc2GiGP33+bkEuol7EINhee9GEINaekGEm+waNLorYseohv2F
         WRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774591613; x=1775196413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=frEw8XRPZHSl4VPvfNJUWaIE7jXhL7iCgDSfHujcIlcd55Um231PrqO2F7g3NLDW85
         n4D4jhlKjbys7u8rmscP/EiT/MHvsWfjM24ERMsga02/yFMWxQBolA27yVXt8xBfh9V9
         1k7Pm+yOO/8Jv38E//jEOvxqh+ccT66gMzZZjY7wHs4XJpmwA497FijZIdElnznswv4b
         61eI3T2F7na8ZRHHYBN8HiliXLNimHaJiPh962TeZmeTzRUa4MuMv8s6BzFIeRpVtqWv
         RD0DMZtplPjz1Cn5jfY7OmN2RyvDmJoXJXQdt/lv1NReXUiXepK+3WFDWxUQEVb6D3pa
         eUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVGPkpUXjtpKbAPnDC2StBJPFwq858OMFskTQe0OFp83XIQ3/xSFFqhhrUkqhXGqa1GlIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/QyMx1wNzE5kgB7xet2Fgpk1G75ZlgWHeXMNBqnj1CnOHOd7O
	re86vcWs4oWbWndwIWKyNIUoV4w3CWrwp2mjqRDyP6S1FWp3C5shlxW/pQWIbXR6HYCj82imzav
	1IM/i8ehNCeRWQzgiuMwvSozFkWQV51c=
X-Gm-Gg: ATEYQzyDAYSs5tnL2pIs3pf/RPtMfzKAJt2ynZm4GPKVnBIgifgJa0ts6Ckhi40SPMi
	huyBFz4A2nfPcAYVlk62viTkAmB42aNstpHrHTwTK5NnQD/qVmg1CR8OsEVWK8UcD5lop4/k8Vw
	ikNwJb7+JllRWwukq2PxmY6cN7As3q4pGdg7EBCTIa1bVc88HLQNiU7VNVdPy4ouRmu2LtW33Oi
	bBwGQQDOrLJXIaiZXJ8WswYEa2J2h8lv7IB0pJ64HAWqdwDbWsipXwQ/1UVBQpnWnt6YkOSfjzQ
	tSwMplI=
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id
 98e67ed59e1d1-35c3002fc51mr1380306a91.14.1774591612670; Thu, 26 Mar 2026
 23:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327031504.497650-1-chancel.liu@nxp.com>
In-Reply-To: <20260327031504.497650-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Mar 2026 14:06:25 +0800
X-Gm-Features: AQROBzCzbEGPPttZKspsGG1E13nIFzodJ2Pa5Qt8YvIkcRF-KWLW83wNwQFeTOI
Message-ID: <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Existing i.MX audio sound card described by this binding use codecs
> that operate in i2s or dsp_b formats. The newly added CS42448 codec
> requires dsp_a for its TDM interface. To properly describe such
> hardware in DT, the binding needs to allow dsp_a DAI format.
>
> Only i2s, dsp_b and dsp_a are included because these are the formats
> actually used by the hardware supported by this binding. Other formats
> such as left_j, right_j, ac97 are not used or required by the hardware

"pdm", "left_j", "right_j" are supported by SAI, so I think they should be =
added
from the hardware point of view.

Best regards
Shengjiu Wang


Shengjiu Wang

> currently covered by this binding, so they are intentionally not added.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
> Changes in v3:
> - Rewrote commit message completely to describe hardware requirements.
> Explicitly documented why only dsp_a is added and why other formats
> are not included.
> - Rebased on latest code base. No functional changes.
>
> Changes in v2:
> - Updated commit message to explain current support for i2s and dsp_b
> formats and new support for dsp_a. No code changes.
>
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml =
b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 5424d4f16f52..75757fbccd89 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -37,6 +37,7 @@ patternProperties:
>          items:
>            enum:
>              - i2s
> +            - dsp_a
>              - dsp_b
>
>        dai-tdm-slot-num: true
> --
> 2.50.1
>
