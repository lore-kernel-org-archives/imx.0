Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67C1E498
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721134473; cv=none; b=QidijTFF5j223CsQ0xUesiWCx9VXPF7hSV/ESpOhpoV8ogcn1Ode4g3WtLkJHbrLWlQ5TnUNXlc86xcT8WyGiVr9EmlEI54eytHjibtbr97WdUasZrJ2F6WiDTeiSERP3AjaZalInpEkz3s7jszEuFsFyGHI8FY24u7tHVpsW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721134473; c=relaxed/simple;
	bh=w443Y11DSvLdjuKg9qpLGp5NVOHIdcdYJsD2BsPm4BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXx+OgGi2GP5AUFmgHEsJ6Al9Oica0EhWZVrjYcQV9tt64Taoad+mysMSt1z7GZJp/CABg+iZ5iEkQY+hBE1f3Fs66aN/EevmV+mDo4DFadjTbkp+WI0pvDkSi+RQghWrBXHBKDk5Xrq4jNc/dDIqZ94evuVrI7pkQGLZ+CqNXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeaYPnl7; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeaYPnl7"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee9bca8675so8297161fa.3
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721134470; x=1721739270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w443Y11DSvLdjuKg9qpLGp5NVOHIdcdYJsD2BsPm4BA=;
        b=YeaYPnl7sXPKPx5dfMrnMUafXJD5deewGjpd71UYAF+qCXIlPixBf1D3SoLahTpxX/
         +Zlb/dD6d8HO3aM3FXuB31JD5gZSwYgBjrdxOcL4rGIawPbmGkQ3NB+ExJRzXAtXexvl
         EquV0HOGQsTVSyEDlXTOy8KBWzkWttR65B1HORY4W6WPercUNY5AZkzCpz/092kxR/w3
         z1HYcuXGMm7tbSb6MyREIKzCCfOoTC+MeLx0s8h1IVgJDeFsSk146XY6P+ODr2uTyh+m
         +6bXqQZK6IspGSwA8F4oi0i6mECLJm9Z865xN4OlMm5nvqHr/WleqV0duXFTOXWBRIxW
         vD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721134470; x=1721739270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w443Y11DSvLdjuKg9qpLGp5NVOHIdcdYJsD2BsPm4BA=;
        b=Wt3gQoM9e1kg/8uPLFNxiVq0lqi+x/mbDSE/X05Ba7xz465DF6YoBOARWBjyKOeuaP
         yJvouM0krabHg5HNPNkTtEVzZr/Yo/F5IXq8WIwq+BAQW+m9suJI4l7oStWIlM9hRgv5
         No7+SsePLUeHKM7ggCvpiXbtlndbmK6qCfPXWF5yTbRtDB4KYi8c/k/dMCXLUru5SAvC
         lAHTT6vwcruc1KZWjc04yPt7dJ/gle4OkFvXjIHbGRuBiiT0Kb6wb761YJGF6x4pPY8m
         Nz1MJPNVMZ1j/5L4lM3ic0iI/s3fbJAl3jonsampFWxhcM8L2SHDRhbU4HUs5NvRPNKF
         Q55w==
X-Forwarded-Encrypted: i=1; AJvYcCXvibglWHmdnTj8BVpMxBrRTu9w6PVjITV0ps4zxPCYdzsMrPBumGbQNbVVKgwkkFNa1X1xq1G1peRXW+g5vJ+0dHmB
X-Gm-Message-State: AOJu0YzfyaD4IX6vF/oZjisxLim+kVtLjNjCdf69vszxHNvJcUpMHQFi
	ONCvpSuZWH1XU/8LcowepfbNEjzDCAvTDumf0ZDl23ESnCzCoJg0dmx6VaXcAMavkQD3Cm4dPkn
	MHlFd4eCNw+wIrvdt0uxqjgQvfug=
X-Google-Smtp-Source: AGHT+IG/vrVAKsY/0W0RBArGdtvKS4CIa8jX+XOvYmA8Zc1PfQP9HbEO8nW0OSq4gwRGiSV2PfZYdZTJA1TRv6MNPlg=
X-Received: by 2002:a05:6512:2381:b0:52e:7bb4:942d with SMTP id
 2adb3069b0e04-52ede18f4famr1143999e87.1.1721134470099; Tue, 16 Jul 2024
 05:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240712-imx-se-if-v5-0-66a79903a872@nxp.com> <20240712-imx-se-if-v5-5-66a79903a872@nxp.com>
 <ZpGr6qKjJKz14J+y@lizhi-Precision-Tower-5810> <AM9PR04MB860496FEE467B7CC7C2DF50895A22@AM9PR04MB8604.eurprd04.prod.outlook.com>
In-Reply-To: <AM9PR04MB860496FEE467B7CC7C2DF50895A22@AM9PR04MB8604.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Jul 2024 09:54:18 -0300
Message-ID: <CAOMZO5ChgVzfnh0COEbvDGKcmVPEjS83St0tRmKdhvKJDAt7xQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] firmware: imx: adds miscdev
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 1:50=E2=80=AFAM Pankaj Gupta <pankaj.gupta@nxp.com>=
 wrote:

> Thanks for the explanation, Frank.
> Will replace scope_guard with guard().

Please properly trim your replies to only the relevant context.

Keeping the full message makes it too hard to locate your reply within
such a big thread.
