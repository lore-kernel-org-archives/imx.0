Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D522F76F
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765958689; cv=none; b=JO7L31ozHCiZlq5rs5CD9v8sLUm/c/3KeZ1fmqXgX7YYxG1m/lRuKNn9FHBaqdL5g92jfbgc4JBSjfJH9d0gcw6gCxRH8prLkgp1XyyYBwTdAuCyCGYAtfdLbf5zT66lD/23DCKEjs6oz705WUfEwODUcu/hS3K+YRMedW4Ay4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765958689; c=relaxed/simple;
	bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juxAHENWKyzTFf8x8obbkadKlvnmeNZNK45e8KIxrJ949JEeWiLVbR4JNll7P1bZLm9Ti9fKgghxhxYKYpjhD/UykcJJwn7+syfStZMQdktTJoMxa3szXOmAEVAjvvvFDY8rVBqam6tXGrRMqySLre4fUyjYUFhOGHdTsubXWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9tea7Y2; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9tea7Y2"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso3499185a12.2
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765958688; x=1766563488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=;
        b=U9tea7Y2ONB2MZBlbh76jH7dBqzdfbLZCDWaptQ2KbMuazPz7dJJACE9gg+siIQIG0
         PX8zB07b9vYHPoCe2t4Vr6DWFyvAD76O6ECC0QgM5nP0ipit9kFkdgXNaKClng5tLqrp
         tqP9ASNXDkGE4Oj5BG+llcRPwe5do/+ArYDLxutfEyNCPC7uU0HWiypk2Bxx3DwFvoI2
         q1t/t526dqP1TDqv5V7eh6Amv5HC0MsOhKtJuXE6FhypwFJm+DYkpln18fGAl4K68fk9
         dC9XXkHJ+UdwNC249S9YMDTljQjwxqgXKscwt3OSFTLOjQlv2JyiuU/kasg9AVKnsXHl
         bIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765958688; x=1766563488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAHyQaeRRYRmEM2JW8aJJRkYiuED3yT0FoQYPAiGLTk=;
        b=E60saIEw0Jl/azAHPe6BCuIIzoaCqTHROrUHrFnMom4TzRNNkfVdxhQACzSjmQoj3b
         WMqQleszl3Gdkm6XaWQ4LpyoNZNYYq9V7Wdsz7YXv4ZNnTmi4GrByRT+M5O1/OT9WR4P
         VC0EjSwlpG2lKqZJvSEf/mfb610DOT4r6V6RfDenZrNl2nBNlr+T4lwM+xv4Rifx8d00
         gQqMvA3Ti/y77E47okG4V7j0tjb3N015X912POWKjiJWc7adL8Dd7IPbx0PF+3KDlLYv
         xfmQ0Ta2r5lsSVuK6egS2cdX4b6n28CSBrKtieFDfa4LwshQeWJXX61xFw8v7IepwloS
         bZew==
X-Forwarded-Encrypted: i=1; AJvYcCVZoj6ZFQX5ZL2WX2Vv5AEiB/02HQ8RXDuIEfcZeHo9QluSJvbPF9CyqdBBvUvm8xr+x2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMJs2qnWKBUJ56PzzcGGrHk+pfBJsllT1NJC+RSJrIGSaG+R9q
	oJTbhn/ya52RKCuqI8B9bWbmCXeLOu20EH6W0IvavQfxcPU4VxHPPxI8v+rK+un+bGVk5RNM7mT
	tTiZZRX4elXngXXKbfOSOqGojxthS9QE=
X-Gm-Gg: AY/fxX46c6TyqWBuvMDn+kttM3HxwAIopZbgBxrpp8pnz+dnK9zM4eZPVmyMku+G2v9
	8LIeH0Jfud2zRgBp75LYDnNs0x0pHonzx7JuwsbQ+lXtl9YRTByAI4CuiVWsUi6tRJivaKNvh7X
	iQZk/vB5UonPHz14lKDiGEFjm/iYdPkdblLE8/CSfjvq9f2D3zL0397dSvAdZf5XMcZrsTydWJ8
	ZzDOQA93EpA75SOLuIJKpY1/3y4vX+L9XDD39LivvoZO7t8rfwUVLOSJZLu+e66leIk4rBJeIuX
	dTAaBOUWu9AdnAKgvKnJ0emaR1eJ1jlMQu+uB0vZa6tJNe3MMlITCcjGbWB+CxKfSj3JKervrIG
	OGb2D262CJg==
X-Google-Smtp-Source: AGHT+IF/Rafya4P9pHjYpat/hvN9Upnikj/jYp5kVk5B+2ai+h8M3blhTlGwS1i4Zy/ud6gAgGTmWeFmpcYsbAk3k5M=
X-Received: by 2002:a05:7022:a86:b0:11b:9386:8273 with SMTP id
 a92af1059eb24-11f34c3056fmr13561896c88.48.1765958687598; Wed, 17 Dec 2025
 00:04:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
In-Reply-To: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Dec 2025 10:07:17 +0200
X-Gm-Features: AQt7F2o4eVZ3neNtlty04YadxDzQxMvRIIi3ajaFZXWNtpnoUCJ29nVTAzoi3nE
Message-ID: <CAEnQRZBTkXtiT1attxPpjXUwLz9bMVXP8_-ChBFDY=V9p3NR8A@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: Initial support for i.MX952
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 3:59=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Initial device tree for i.MX952 and i.MX952-EVK.
> i.MX952 is designed for AI-powered sensor fusion and vision sensing
> applications, it features 4 Corte-A55, 1 Cortex-M33, 1 Cortex-M7 and
> NXP eIQ NPU and advanced graphics, video and advanced security with
> edgelock.
>
> Product info could be found at[1].
>
> Note:
> There is checkpatch error for the pin headers:
> ERROR: Macros with complex values should be enclosed in parentheses
> checkpatch.pl maintainer said "Just ignore the message instead", see[2]
>
> [1]https://www.nxp.com/products/i.MX-952
> [2]https://lore.kernel.org/all/fce65a7761fb0e880beb469e2521598f@perches.c=
om/

I think this information ^ should also be placed in the commit message
of one of the
patches that gets merged in the tree. E.g patch 2/3 or 3/3.
