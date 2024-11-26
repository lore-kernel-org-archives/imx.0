Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249E1B3941
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635011; cv=none; b=SNVAv2dVNvltS9lKCcEMUHu8v+NWfRN+GFahyxJ2POLGSb4jpFwcBs4po+7zEz/o7ao2m60CEremzGF+8vEa+CiarTz4MuU5IBwdFdlYsSQ70r3/HP5XTR353R7TJiUL+C5+b7OrNEloqOuUIq31RRhIToJG2cjrRS+Ph2yjWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635011; c=relaxed/simple;
	bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YG1QYlv7JmlAtNKCQug3+DpVsCXhfsmmZBom+1Y6FGc/tIltF9lBJSlXCpMUz9ApHiLsscN/A8faAr4ir48wPSTANtrxNvFdwCeQdbghoi3ZPkzqp4ZE0k+Hx1DXZrlHouskPywI3ETpDoh10LAXH6+IAoL60gjPCVOkN7Ncfuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeWVxIso; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeWVxIso"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-724e1742d0dso3763239b3a.0
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732635009; x=1733239809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=;
        b=KeWVxIsoP1GDU1/Yv2l36YjKtUi+HXqUzwrqSRUXMAxNg3QkhosL4Jdhdc/pl8pmxE
         yvxBMe8Dv8ILFvt9/C0PoOLmWGbpIwqBq21ALeMIaA6YWkuEM534rrAXd+qwREmCTrbx
         wxBIInR2a9k/CFHi7AiZrttKvKobCp3u9wzcryKNUwgAKky52hToEJwD3oKDnr8qc7zB
         ZOTPzMGy0sCI9NJrLWSLFXYc9OYrqqo4fUCLB6/MV/YX5OxDHsF12OXrNLn6H+iNn+JX
         OdbirbW7pxpJrUTvdNdhMYGLlfHo7ZDhu1vnOwTp1+9sRREpOrz3utbpubUUs/WJ6DvM
         SpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732635009; x=1733239809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=;
        b=jiC/N1ESOkEBaZ0pdHTJ0ws6IhnvWFwxdO8jmdg+gd9JMAHMIUlvLWxyM7CmlPpd36
         VHZs0QCCSrCrXKtJZp+I/9Eb+0BQuqSXl1CGrhInvSomlVVe8/HX2PlS9LZmni2LGEXU
         m3H1e4E8fjRM2mgaGzlxuY3wOWjuQae9Y1WRsJq8LzxE1e2J4Y/iSCqym+O9G5I8zla9
         coa9J5MginiliCnBQq8BVbtWP/2Zer4rANIAqPVSMNFqvNOP4kaQwp4pfqNw5DO6TD/k
         vreTmi8cWEf4zCQrW4vdkANs6A12xPhf6e5GGl21keUdzqPkTtj4KuB4oSF+pIZEwU/l
         p0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVxirs/Z7Qjiv16+co7rt/c0TUj5sTvOJz108hXOPinhEvex7uQ9TuTGzqJbpaEG4bnzNU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk8ZinFoGKsWJd4k140k2r3Fp5Ha2ZOFFWDAwRWcpkzuDaw9VK
	vJZZMc8YQPFBUZzenR4ALbA6UkvGK0jlEOyX7uLLIgcAfixu0YPJPYIi3ve4Cf1cit63EJBiiaO
	yofPblHHCy/T4PJ9SzKlYgpxfIko=
X-Gm-Gg: ASbGncvWGWv2hSgJ9r19Kqwtg1YdiRj0L4gGZw1pyPFqysPaeQl7wLoZJJudl2I/0E0
	QtkQDAr27/fmg3gTEJPQK/EqKB6M=
X-Google-Smtp-Source: AGHT+IE+SmZiC8p1bNoQl+mNZuGid7/lVlvbrYFavOShe+NZ2CQZoGtsNSljGtzXmRs6oybFN33p4fu0cBJQOnn1jEM=
X-Received: by 2002:a05:6a00:92a2:b0:71e:f14:869c with SMTP id
 d2e1a72fcca58-724df5d4b2fmr22690572b3a.6.1732635009446; Tue, 26 Nov 2024
 07:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-5-daniel.baluta@nxp.com> <Z0SvF2tQR14jrHet@lizhi-Precision-Tower-5810>
In-Reply-To: <Z0SvF2tQR14jrHet@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 26 Nov 2024 17:31:21 +0200
Message-ID: <CAEnQRZAVmza+A5QC1Xq4dsw1WBtdp0EoM505+UzrCKe15+vqhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 7:08=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 25, 2024 at 05:24:24PM +0200, Daniel Baluta wrote:
> > imx8mp audiomix contains a set of registers used to control
> > the DSP.
> >
> > The dsp will use this to acquire o reference to audiomix registers
> > and handle the registers to control the dsp.
>
> Look like this is NOT good method to direct operate these register. If it
> is reset, you should export it as reset interface. If it is clock, you
> should export it as clock interface.


Hi Frank,

The code to handle this is already upstream and used for:

Remoteproc

https://elixir.bootlin.com/linux/v6.12/source/drivers/remoteproc/imx_dsp_rp=
roc.c#L991

and Sound Open Firmware

https://elixir.bootlin.com/linux/v6.12/source/sound/soc/sof/imx/imx8m.c#L23=
7

I'm not sure if it worths the effort to refactor this for such a
simple operation.
