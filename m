Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA662D9EC2
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030353; cv=none; b=Eq1cQVishRonB+ZSYETWlADP6vyE6lzAYLes/Go37iB0hMtl0FiHRvT1HjuspFmcosh/WGzEN99Ltd5Mc6+tV8fuOXeEeyhMGbyW4q3N6b56Pu/t19uXrnb1GSxWOY41hChNTOnU0qwhbFp7PnxOT8Ov5eTn+tRrGZVVxM28Zj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030353; c=relaxed/simple;
	bh=r+vCHV0VQ3uqAEqelpGMeu4mfO4ZLC4xRqRONU7l88I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmYO9OhOWbSr46TrCSTYgccO3GIAOG16Xn8T8r748hQz5fcBrxrqJ5pUTsAUFjXch5CynoFhPSoP/TZr6TkYVNt9C8MhfS/2SUlxZLBHwUWj5sI6r3O2VxEcsJJS9/boZxqNzh3vsVLXfVtmfoKVPlTi/tJZk9yCXGoI/vfYORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hms5Ap57; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hms5Ap57"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1702007a91.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030351; x=1751635151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=hms5Ap57Jv/FVIu/uF7KWgLhZeAruMek/wOabvwGTkFGko1U4DnhOjzI1RMmC1cuXd
         qvSPIsojVuEkqmINA/EkFOQX5d3Hcct0VgYyvsJ5FPUroJLL9dfcTk7c6yIUcanRugJ+
         6ku0LkhVCURiiSE8q9MaRK6j1FmrayeajSNkBQCFIYaoGIouZ/wGxCG3xaMGqgZDS119
         mQVNyoca4gp5BVx3YoxtUDZVyNsyGd8/Gm544ucSKufWOulRNmACGG9rip2mBiHC7//u
         kc5hR+FAyeMCIfKJk8NjgA2VaUcWt3X3VSLTm3JCvGcdP1Bgvaw3dUkwf97mVFvGcbbE
         U1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030351; x=1751635151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=tOhPmtT/V33I9voAoYISBwfuxQnupmns6oYSflTMU4Vo0PtLQNYeteSXbNlPqcM+mt
         bIx9XFPRqWX7IGkUOfZ09SF/FSwSGSyFhos6S9g3mv3fTe1kSYdCXwQryFw2wEZZBvEx
         84uGLDZdMTdFrffA1cR65V8QOxDc5Vpk98hkOjlPDy7FgJRrsCMPvGq2uBHlbfDlP3xB
         fnpYDSitzQh7Y9KcugVZ85s2NdVx3coM7oE72w1aPA5Huyas+P6L959Ao13MmUYWSQSM
         l7S4s68Y8qTYBNlM8oOYz1SwAJEFHQ59yTZaZiFCr5Cj0V2CYbFuGczmLytt81V3TclW
         pMHg==
X-Forwarded-Encrypted: i=1; AJvYcCW1aQVg9tqw146GaxKIqTdk4geMVoHrg7Gsd4u46mXWC2Sk9gN1FW7gYi+WKXXajpRp3uc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ekApvxB3AOCvFSSFKjmURE8VI1ymdeMi5yMQnvb5qh4hqcNR
	RHrwusjLIsSmLMu09qLAwr/VvkT+3aHGasjE3N0r27nBJXYLIWUn25XNpxZzayz+xGt/zZBSe5U
	ePV1iP6FJi1sAuJVCnn52E1ai95CPym0=
X-Gm-Gg: ASbGncvQppzH3PcDb4yMG45Jt312AtwCHDuhNzBKuXpKh76eScULadD1defXlrdtAIP
	zq5ZFFDNdbUtEUPBD9DpGlWIkhUJEhSLd4gEi0JnzWKy+My6+tcxrd8aWPskfCiRs4gMgweFnv2
	EpFAr4t0XAzkjANShp/yomGGinIthwhxBvSiafkbP0o47QNubwXRYN+Q==
X-Google-Smtp-Source: AGHT+IGuDUwfIqzzDEvXavoJTZSrH/5OLn85eSiig5eyOQ5l/CyM5CDTHx0eNi8xE3Ifw6y62UefXmBp5cIFyf+XDbE=
X-Received: by 2002:a17:90b:530c:b0:313:28f1:fc1b with SMTP id
 98e67ed59e1d1-318c9225e3cmr4981774a91.9.1751030350976; Fri, 27 Jun 2025
 06:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-2-aford173@gmail.com>
 <20250605013023.GB29462@nxa18884-linux>
In-Reply-To: <20250605013023.GB29462@nxa18884-linux>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Jun 2025 08:18:59 -0500
X-Gm-Features: Ac12FXxtQU4Km0iG8bo0b1N6dVq9hbbMuCpXJFyZ-RZRycrANe1s_6GUKni-xpQ
Message-ID: <CAHCN7xJFm5qcnVkiOt2+vQG=oeys=_4gonc7BkMWbXM-p0iURQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:20=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> On Fri, May 30, 2025 at 05:17:08PM -0500, Adam Ford wrote:
> >From: Marco Felsch <m.felsch@pengutronix.de>
> >
> >The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> >VPUMIX power-domain nor their module clocks since the power and reset
> >handling is done by the VPUMIX blkctrl driver.
> >
> >Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> LGTM: Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> Just curious is there any issues without this change?

The vpumix_blk_ctrl driver handles the timing between the vpumix and
the g1, g2 and vc8000 devices.  From what I can tell, this is required
to make it not hang on an 8MPQDL where the VPU is not present.

adam
>
> Regards,
> Peng
