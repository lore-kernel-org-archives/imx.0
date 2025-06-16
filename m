Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F22877F0
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080628; cv=none; b=PihIlV5jG07lv5vrnUFVVLqDPiM5q3v1XQxrk2+zl3h+PJpa4NpmqY5sqse5NJSmCRY5vevZYkd5hW1obN9zodZosAh9mxho8glaz03rGi8O9tMsHjNziLsDRmOPfd37rx9RESLQUSgB3KMLMmK70pN4HN/KGlScbfyJxc5bDRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080628; c=relaxed/simple;
	bh=eSGM/kHiThLG0+4KJzd+4iN5W6WU/gNP8I5Ybs3fFmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWSKBFxoPvT01+cKXUNZ2Zt7Fm8fAaPqcAlycJcRISJUsPDLQJy86gxdoTBM0UR2Fvl24an8BFEJlOJ5y3PP/o93OYBCsRHjuNMDrkp9fbFyJJ/5HYMuTCKuAXi2+44BD88FTwJaBYz0rUg0vV6oqoh3XS6HW94EJeoy2JI+WU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkQvrqBQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkQvrqBQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-236470b2dceso37089035ad.0
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750080626; x=1750685426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=jkQvrqBQpUR54JwNvUL7VqDq9jDosdlQWXj4E4ZgG8GFN/ZYrlyCkQTS2kkArkj4Yc
         6yumraEtMEWpj6lzWc5SWzknQMy6TN+CpShyD87wULk9ilvCwyKoiAzBnKqqwyVsoL/n
         54AKQdFaVfn5gcZ06K4trGtSzIZGsU7kmF+MwXD4zxKKiTqkUHBrwcVaJO/s4iWuhRLo
         t84gbxEn18z3WsumSu2t88tvIf/JiTCJecMn+uS/EU/bpVxyHf1swnNApdoblGCtrpM5
         lefxPAtG1wBCRjDlZ+LkNmWRrorBeFdXv1SQZQ+pvLXYd20Voz7fdEdNws2TqucE4z0Y
         jCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080626; x=1750685426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=F+XTwTFgZHafbpVQuD4lQzIKJSV3+2eH+lCap0yMOAWHqUqx6wrl6wC+DP64GdQwNC
         SsVgyDvSGYUkue3M+NQBXKMhgP0w7Z2qkt51ODgGS64oY/OsDbvmaPaik6ziuqbYhr33
         N//VntunwsfqQwJZCEolRHlizc5Wc5wDeWoFia+6AiHM8rNRBgo1uy8f1CC37MaQvvV/
         BoPogJTxn7uJbdU/8TP5JCoZBMJprXdgimMtyyOfSHACdm4myyQPUniN56E8sNvntCK+
         8vPyfw/OLo/mlJUtRKU7BrbvbZENPBO0qm3HxJxcKt4GN53lSDVdwy0smWhZYBiidLys
         100w==
X-Forwarded-Encrypted: i=1; AJvYcCWLaGNlktv4Da+sx+0xgrXRU7traM16LwqCxTvOnqEKeXlTDj9iXRINDdz0VDzubkpUUg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYbn0yVX8iuvy7RGRmM0+HN4TYLp8MfGbS4G1upxiXZIKR5HU9
	vB0XR77Jly11f7E6+iXbpD2vgcOe5z1v4lGIewlFLp9YE1zBwhUi1XzsFG08NmqqEOkz5aeQQLa
	3hTU8xhoskd/HqyQ2aW/au38k8bnmYls=
X-Gm-Gg: ASbGncsfQaAQow6k2l4UpZRtnfUneF4yqH7b5QBCe0204cZusIC6FA5Bx0DW3vArDab
	5tvSyUnOletCy+HkGQAF+j2LeRaDXG+yAREBAOFZ0TS+lmxGntuUOJlXTGoeU22WkpzxNFU113v
	WzKrS+f8WPh/rsTUVUV51gfG0/hAdb2aqWZeud057P
X-Google-Smtp-Source: AGHT+IHrnOe9BgEaf7IB6cKO8/zukFqN2HZ5IAYeo7rZcnUwyz06zgXtx6or4FKsocwZQxMzpq7RhmfRl7nR3WTEeSU=
X-Received: by 2002:a17:903:228a:b0:235:1962:1bf4 with SMTP id
 d9443c01a7336-2366b32ce3amr144470995ad.14.1750080625607; Mon, 16 Jun 2025
 06:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:32:27 +0300
X-Gm-Features: AX0GCFsogmtArdg5rIwFR58rkkFYwbGckSH0KHSur5wUDe92Y-KCqAhSavVUQsU
Message-ID: <CAEnQRZCq45wzoDLd=_vPn8cNkiVrbYrg5LJwbZUSdRndRn_U_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
