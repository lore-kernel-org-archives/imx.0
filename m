Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A91F5619
	for <imx@lists.linux.dev>; Mon, 26 May 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257641; cv=none; b=qI8VMcigA1k9L++L89D3fZcQ32v1COHMQiT+hMRvESeOzIKInzhgJCGBE2goNmJOwSGDZ09GqXEi95HcoGN1gx8bX5isubpxPFw5il4Z2Ugdb9X6q7KBwlpBqqyNoOOLF4DEMvPmpf1o/0axP9MiLZP4uoyUEIl/RZDg8HeWIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257641; c=relaxed/simple;
	bh=UJPyNfsZn3c6m79iQJR4snROO6tMz5x2Xulu0fzwq9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RV8DuTC6dGY4WnFBTLYvG0wN30qMk4Ntm58narSAVQUX8qGetX6NoVR2UuI41en9SoYuPnoiatgeEzYGmeLH+y7CXYO4G7cd31joky00jfbJ6u5GrVv5bdcCxpREMdKEo2uFHfWVD2nzdbSWxPQAadkrYzepBExFLExyhch/sOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyj3+FHy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyj3+FHy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234496a33a1so6739785ad.1
        for <imx@lists.linux.dev>; Mon, 26 May 2025 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257639; x=1748862439; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=iyj3+FHyuMwfoZDmE3LHiEmDgvETyGnTZjKf5pNr/A7ZB09Df1eILzQ3z+nGVjFqZe
         Il5Yw9uKV5XpHgSMOUEyUPUJ4nM4AKAFguHk1IFKqn8ciYSnlxf4JPy3o2GWZ7uY6pXc
         EE5WdueLfipmzPp/JCKbenarD6q4uLnsc6SHV420380YB3AHQEtuu9ZiP+yNzC4T0fMc
         C9fLD7GscRwUkyx2YIh0B/aNCZrhFDIvy5IkpZV45AvLZpiGWpqnlbJb6e17ectXz8J5
         0Z3Lsr8DkN0iYsKJP5FcClQY1uHvBFUh8Kh+oIdWtcDU5oTWm5/agreVYLV65i/40GLR
         PWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257639; x=1748862439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=nWJxyRoY3dViefcTYnoEXOqR7mhW26ZhruwxLcWuFvoZIg3wvZm9UdNoD9oc1sSV3M
         ds3nrvH8Sa08cn0uB81fj9b8AOD3vyEwxQ8KQAC5Pe0BEm7ig6HsBYgDcPjEDnTcCI2s
         MYcEUln7nzq22ylboQ1tnvNdQNSYAJv9keF61qqcRlVurr7HgBqF9FBLTxmlRRyJKb+K
         pyZE21BzWXkScmYvj8z0uAg/qfkjN97ERKVB5DofcGHskIvfiX0gC8kzbGUT77dtyXgx
         IooCxvGSsgjmyF33TgVET92eGsyGktx/D3m1qIT+Unt9pSPf8unjMg4n2O09Md6IUrEn
         Q4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU7yqYd5KVBxU+pIrJCYUBtia+v4kWchVRRN1PTS1DXspsJNU0IfBEN20lYbghE8vvSHgI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7e1zi/RBs93AC6si1Q2ST86+irx6Mgkc4QySgMgO9kK67VHA8
	y+EU4207+3fxpKlu0HCFnWGCQwKLBKWX+GzHiYvnsk9sqk6NQNhcXrlo4QeWEeZ81M9aiuVD85X
	uUwYSDj6NqJTe6er/Kn6GD5iukDhkn28=
X-Gm-Gg: ASbGncuc3+lSIif+g0Q/V4xn5/+CFY2Y+/5wldVDGht3q8+G9QWW5hkUA7ZOQz196Ca
	iZaeeSV2m7W5b5UPllQ+MljH3dzT797HD9yOUlNHHI2ftTsao3oTax7Fsf62O9FSQsB7VsWjtVf
	8Vn/7EksnzCjl57k5ZD04XleahJfGKAA==
X-Google-Smtp-Source: AGHT+IFNUkARStkUU0yA3GEirT+p8/UabY84M61srXw809EWJlrTdy0hxaH1tDIgKxVdp+S1wPaDN/JBZ+LBbWYliac=
X-Received: by 2002:a17:902:cf03:b0:231:f5a8:174d with SMTP id
 d9443c01a7336-23414fc0745mr113084145ad.44.1748257638727; Mon, 26 May 2025
 04:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:09:00 +0300
X-Gm-Features: AX0GCFvFAHKTv9eLfMcc2ymFlTkdSDqneLYcacXjWWR2TG_Yd0O5c-iBoyzpmKk
Message-ID: <CAEnQRZC27dgATvvALcEq+8t4PrqkHJSrnThT9P58idnn3bve0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Gentle ping.

On Tue, Apr 15, 2025 at 8:21=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The AIPSTZ bridge offers some security-related configurations which can
> be used to restrict master access to certain peripherals on the bridge.
>
> Normally, this could be done from a secure environment such as ATF before
> Linux boots but the configuration of AIPSTZ5 is lost each time the power
> domain is powered off and then powered on. Because of this, it has to be
> configured each time the power domain is turned on and before any master
> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>
> The child-parent relationship between the bridge and its peripherals
> should guarantee that the bridge is configured before the AP attempts
> to access the IPs.
>
> Other masters should use the 'access-controllers' property to enforce
> a dependency between their device and the bridge device (see the DSP,
> for example).
>
> The initial version of the series can be found at [1]. The new version
> should provide better management of the device dependencies.
>
> [1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-da=
niel.baluta@nxp.com/
>
> ---
> Changes in v6:
> * drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
> help with making the DTS more readable but if it makes it look worse
> then there's no point in keeping it.
> * use consumer ID as first AC cell and consumer type as the second cell.
> Better to go with a format that more people are used to as long as it
> still makes sense.
> * pick up Rob's R-b
> * link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v5:
> * merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
> currently only used in the DTS so it can't be added as a binding.
> * place 'ranges' property just after 'reg' in the binding DT example
> as Frank suggested.
> * use the  (1 << x) notation for the configuration bits. Previously,
> hex values were used which didn't make it very clear that the
> configuration options are bits.
> * shorten the description of the bridge's AC cells.
> * shorten the message of the commit introducing the bridge's binding.
> * pick up some more R-b's on patches that remained untouched since V4.
> * link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v4:
> * AIPS5 node now only contains a single memory region: that of the AC
> (just like in V2). 'reg-names' property is dropped.
> * AIPS5 node now uses 'ranges' property to restrict the size of the bus
> (1:1 mapping)
> * change the number of AC cells from 0 to 3
> * add binding headers
> * link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v3:
> * make '#address-cells' and '#size-cells' constants and equal to 1 in the
> binding. The bus is 32-bit.
> * add child node in the example DT snippet.
> * the 'aips5' DT node now contains 2 memory regions: that of the
> peripherals accessible via this bridge and that of the access controller.
> * link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v2:
> * adress Frank Li's comments
> * pick up some A-b/R-b's
> * don't use "simple-bus" as the second compatible. As per Krzysztof's
> comment, AIPSTZ is not a "simple-bus".
> * link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurent=
iumihalcea111@gmail.com/
> ---
>
> Laurentiu Mihalcea (6):
>   dt-bindings: bus: document the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: add aipstz-related definitions
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
>
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
>  drivers/bus/Kconfig                           |   6 +
>  drivers/bus/Makefile                          |   1 +
>  drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
>  7 files changed, 251 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aips=
tz.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>  create mode 100644 drivers/bus/imx-aipstz.c
>
> --
> 2.34.1
>
>
