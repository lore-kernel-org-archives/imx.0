Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211F14F9D6
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373724; cv=none; b=F5ztPsehtbAieqAWSC5B3rX4um5VTMKJfUqGBPg8QL+YcAINBooQC0kNswWSC4MRPxt2ZIBvRMtwbw96gwG16rmTZPBmLKsGogole2Ks33fdIn0hCYaQjB8ovyxcm1J4yVSg4Oz0SzcRu69hfXxij+b4gLk70soETc3HEb8tOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373724; c=relaxed/simple;
	bh=VKKNvJ6eiGKtuXc2h+IwHD2WLZaWPWtYgU92DtTw0k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOxLXldarC7ILfvBtKjGz4jed9lDj5n9CcSse5yPmLy1zeeluHBqhn7vXUS23YEK1NeWE36dh/rI1HTh0ZmdhseXcAv4g4PR6L8r7bzP5xYq1ZtZU55rrHG7F/d7Ej6QemT/D3WFTb119A97TinQMaGZeZv+P+sJPB5dvRsydSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCWQEeD+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCWQEeD+"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f163e379so339011fa.3
        for <imx@lists.linux.dev>; Tue, 03 Sep 2024 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725373721; x=1725978521; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKKNvJ6eiGKtuXc2h+IwHD2WLZaWPWtYgU92DtTw0k8=;
        b=XCWQEeD+nRXdYsR8dD3wEWe4h/AX3tQhXj1EhdZgglrgfI+CU55bdJB2/zk4eSyHjs
         bZo7wsowysh3ZS4vPT0s+6WZchUfgxFco8Nxgm46lqQKOFeut1WSXzSgFLVhScTixb1b
         CgGnTb0eUaJiZyIZRJRcvTdfgjoKuBBWYz8GioCj5shfGuDo+Cggw2fNd45Y3swCdLFH
         /2AhqQYAswqEuJFxzsnM1Q/6KvksMrod01urrzfwR0H551/OiIYbKY32BfzrmIscryEL
         PTJrYQA71d+Iblwyn+b+b2zd6l4LdRB4Cfw9nCub2UwAlnqxEfHdp+DssOTu2YQepB+U
         Pi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373721; x=1725978521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKKNvJ6eiGKtuXc2h+IwHD2WLZaWPWtYgU92DtTw0k8=;
        b=pFP2dG9dNrIlZcPoDMXMjYmLFZpZ5t5oLLEDuNyq70lmU3CS0yEGn9pfNW1B/0id/Y
         Vyh2W0ABXs2SVRJHd4R4ClSG0JUo2es6pl6xdY9ucZdBlTqMYEUoaQVzYkfr1VMPnOqa
         /e/bZbott1RCWA6tXE9MM2jmp59YNQN/S7axeLc2pQROttnol2qT0r/l1yC4NPjLR9Qp
         Ni4LfjjGrjEa4oGGFsMrzkS5tkNlRxziIk2B6GjPjxfmpSPUyW9A/DckTP4kZhGPT27F
         0cWqeMpijMTp2BzXuU5S/1olA4S21Prb+0UiQXnS94vq87Yyxa6Kl/V3ljtGUsiwPuiF
         OH0g==
X-Forwarded-Encrypted: i=1; AJvYcCWTIjICxvVAgyin58xzsjBhNBvrQUH5MuHjGW0nJgJ/OxrhKaeHoDEjM4Cv4FmU453/VhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMtsvBLPaGtbZRZxsw2PuRBLkXX7Kz7YidHL0/6JuxwXuzIJRN
	Sol1HwBtv9cEHsIwXHhi0nqBSe1/mLM9w01SKgkJ0iif61VKnKAET2tw2G564nTsZPdxNYuugj7
	O6gd9ApdHAe6mzUS06O1DN9av5TM=
X-Google-Smtp-Source: AGHT+IGCO1CzOe01x2gBVQqFSDi6qd3Veq6Yt+sGuAWQFT1yn9+VVUGsDueXdBocFTMYsIqtb86HTnyDp1Iz04sgASA=
X-Received: by 2002:a2e:b8d6:0:b0:2ef:2ba5:d214 with SMTP id
 38308e7fff4ca-2f6105c4facmr169146491fa.4.1725373720919; Tue, 03 Sep 2024
 07:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903091720.443091-1-tarang.raval@siliconsignals.io> <172537334994.875077.18308965320836312656.robh@kernel.org>
In-Reply-To: <172537334994.875077.18308965320836312656.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2024 11:28:29 -0300
Message-ID: <CAOMZO5BNYopFt=_o5qrK7piwxYwF4E10DzCKPW4oh0k4Yj0hUQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, shawnguo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 11:26=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> New warnings running 'make CHECK_DTBS=3Dy freescale/imx8mm-emtop-baseboar=
d.dtb' for 20240903091720.443091-1-tarang.raval@siliconsignals.io:
>
> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: /soc@0/bus@3080=
0000/spba-bus@30800000/spi@30830000/can@0: failed to match any schema with =
compatible: ['microchip,mcp2515']

There is a patch from Frank to address this compatible:

https://lore.kernel.org/lkml/20240814164407.4022211-1-Frank.Li@nxp.com/T/
