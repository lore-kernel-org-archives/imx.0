Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395744C6E
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092115; cv=none; b=Lq/0S/iXbb1EzDWbEsTMBJMWy3MUPUaxZzbAIKxWItvDnHEI47iev0Q7sXWdU8RirImeR1X5Jft9lMExckGOuEq469eDq1McKXc5nPFWMWhVq+InB3EI2TCUW0fmBNOKGRYC4o3VOtuAhCwCArCmuhnHAjv1BVvVr9+dGWpVC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092115; c=relaxed/simple;
	bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBXfV8pi5ve+b+ao/C8GQTA4EuHc2aQN3cQHBXK/RB+w/AZGayRSUX3HR3vXY5C5mDV/TUQFEsyn+AlcmaM9sFtr6x3Nj/wJUhFUkiHJRNTUCtbsESvSxQUL+zmMDC3MD2XEt41rDDPisdCNpHhFB5BrSUjDaEpRHQwTpHK2reU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdOM/TW0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdOM/TW0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3011737dda0so1521079a91.1
        for <imx@lists.linux.dev>; Thu, 27 Mar 2025 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743092113; x=1743696913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=JdOM/TW0hAAxk3Tu4Fi5SXbhEi01qC7Rw3lx0eV0k+FYx0/LhKy1Agd3trPLbNhIIH
         o/eXeuTsjWh/j2lmdBKZCGWwF9/W25Gp6a3xremY4zoln2WNHqybaY+QXkSgyz6UneiY
         O6lc/USDOB1zLbPpOddI49hEQpiVgKjsC5j7NvnWrwITCR/hUcsTZJCcJdCpueixwswc
         aGvHjRx1XKTRF19VUSrD437IJ2B8Fq/NXJwAWqemPyeMDvOWkHd8wrlIaohSIOxdBpYO
         mBqlmJNg1fMx2ZE45h6JtJH121BUU+yiUeXb2FzsMmMSdnu5KTxWAthZD4glhkif31wF
         wHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092113; x=1743696913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=XmhSUvVQ4eNhWeN2AL4GSU6R45FS4uZIFl1Vuh3VW20CTEU7l+DYizncNCCY1cWesW
         YU4wC6doMn2TskSndwtoXaO5oN1eD7zBu5J2wq0aXvnuYguA918C8OMv4n0SpS+Kb3el
         ItH6jS+/sE/6KTPHy4RSyL6kcOUMvGxVaUOwiTs+JmnNcvmXMYSS9gptasP+rzdLpK5D
         JYD6ezCc8CvfilSu/Pqmc4S8MhasM1/jCCn+uG041E2LExLKxol0RoNizgC9QEHbIcSz
         +vzmJT+n6YkAyECPbt+KyBp23YProrqn62NWGjwGhulDmi7/WTf1G/Om5Bi0gTSeinnA
         tkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS9cO3CBnO/nKySOD0gKp0uqUV8OWLN2DT1c4/PHx+BsehV+cJIRff+b8GDyyRVYWMHsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsfLzaPEuIcywGmgTZ2ySU55ToH5fHstvf30cTRhQ5c5SjIBrT
	nFw/lYZZUwKtTXSa/d0daoGrE4uKGGKSki4cLu8q6RbznSVCx4Bqu21iVMuPALV3ZDfutZyE6V7
	pLToy+UCjEu6O2aXicnT7NdAeJTg=
X-Gm-Gg: ASbGncuFzsUMRDowlubdrcKmBTj5vGE/ZyZ8b9vUxCNwWHsYEO2D00rx22kVNN+jjY8
	735f1A5syMzULv2plRDhgojoQ1tlPuIiKzoTqLZJQALzH6xvU2UhollUrcdjsdRTNuy4xHwOn6H
	fsfnuUvCCl+i6UPj/c8I/MllI=
X-Google-Smtp-Source: AGHT+IGxfLnA21DnRIbYYx8S6PoJ4aTz0uiokeIMBWjywJxr9DzgkdlxVh3T7ZtOpKy2EtNnbCJT4rNDAaVAjO4mHv8=
X-Received: by 2002:a17:90b:4c05:b0:2ee:9b09:7d3d with SMTP id
 98e67ed59e1d1-303a81651bcmr5489458a91.19.1743092113156; Thu, 27 Mar 2025
 09:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326215214.1706887-1-Frank.Li@nxp.com>
In-Reply-To: <20250326215214.1706887-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 18:16:41 +0200
X-Gm-Features: AQ5f1JqSne5RAICGf_1pTfxM4Me80uo-4iPsnpzylek8szz9S9jRRSHS2H44qaY
Message-ID: <CAEnQRZD+OUSuysUBmReO0kwdZ61oDucXF7nNAuCYArxk0sRUwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:52=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move dsp_vdev* to under existed reserved-memory node to consolidate all
> reserved-memory together.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
