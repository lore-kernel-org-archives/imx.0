Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E118B494
	for <imx@lists.linux.dev>; Fri, 14 Mar 2025 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968953; cv=none; b=AI6huSLqtUDbjmD2qHn6hHKVYik71bjGeud/DRWkJ0zO2T1aUYw0HAoSDmc1cjDXHuEouCYok26txfvlLxcc7rEnJyg2jD5j+ikA6MUJFmLPXx35DX2TsNPkwf1hrDyMpZ5IfnBYTdngCQaXjzaeK0cOoC2GXhZ65jd28InsR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968953; c=relaxed/simple;
	bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVhPuqZlxMe0A7Jgs7irkyA+S6YrHThcYDqhE0EN38OpDZ+YrQuiV7akY7sfdM3d9zLgntF4Hmkjx+1KkJza/oNSOI5tLG887tbSC41QZ+8FPNH8fajh74JpxI11ktFNlfPAN19sKctlFLTw7vpeFW9YbBpWNiNbjjeI+nCWIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmuOA9u7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmuOA9u7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54998f865b8so2030068e87.3
        for <imx@lists.linux.dev>; Fri, 14 Mar 2025 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741968949; x=1742573749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=;
        b=hmuOA9u79gQCMx3LZbIB0hGp7iyFDgk6PtGJrr62jnUIhdlflmjhESylOBh3EKSXPi
         w5eDDme5mj70vMxwJCO3O71H1LFSiorIGPzeiqPfFXlyirTalQ47OMEkq9HhptgXpwEm
         w/Zs+5Hz0xB4b/J/t8cURa8JPoiG3Ik/GRFbFi1Qm64/pgonmNqZk0C6F660vbmCxDE8
         vKwgYnA0bjObTk0t0LhDzL/cc/bKUX0MbL2yU6g+EfAo/4/NQNa6bixiQtu/PlOqGyIZ
         ca4/cF22mFxsv5qDG70GFxGUD0S1yIF+weaKG9wqG2CVVzjGcmUlyxg4UeidpraVib8N
         JeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968949; x=1742573749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqtk7IJNV0Jlogzo2grgXmBklKukxwQuYjeZqgeesfY=;
        b=T+2LdPf48nOEDXwdRe4kWwSfzIvmy7uvwNAwqAOS7Z9ig2T1aTGXXpKxtzxteoo9b3
         c859QtAgGSIFU0clIPGyJhUq0TgHmak5q6MXu1oSOLWTs2VDRP4IiJIdOW6eC7AElfNk
         pAZi/ICqkmfsZdLMUmfDGCqzGCW0rHG1QDesI+j5XDV0jliqwFj/O87j85v2nPXwX5hW
         KAz2lQPWY8kAW+YaW7K1tYm3zJE2HRB5jY2X1kb77G25acJacfIm0/+ARIjlpzJWFQdL
         PfyIcu4toBwhftM8oRXKnpsRQYUGQT0k2KCKWsfIug3iIXlUCPWoWJWATS1N0LNCejXY
         Cdug==
X-Forwarded-Encrypted: i=1; AJvYcCW7Eyl6oaxt0E4VetDuSx78YO1Z3Q4BEpwoURnD/eCWhIdy4WG3u4RLO8s/OYrQfVhDCZU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR/NL8pU5E6gEl9hLdOF2yPkDVN3ujBb8wWJTkyNqemdrmo+xb
	uca/ba4lQp7ovQBK5I/sTOHUuCM1MczMIT3dYAat+VrsA+GTRWfGEMcjuNgV4cFtVQ5kxCI8Ryd
	32dgCh7V5IJFcnklA0yHZjRjbj2U=
X-Gm-Gg: ASbGncsihDkOVq1mfgehl0x6JZHvzwDxNZ9GDcEEbr+4JY4dWCOy/aDQiW4dqBGV6ru
	FcNuSKY7cJZVxU07yvaZVhv0/IvQY5A0a9PdolkbwkX5WXkg/FePyfJzuNV0SeQWFThPk5YG0ZN
	xldbKXu99t6zKLxGSGsdu0lm70y2dc8y3qIL/BWyMbocmSf5Bb2Li5bUZPsg==
X-Google-Smtp-Source: AGHT+IHs4vHG3o/VoTCk8BvZAkaA4ZWrJ6VUBnc+4V5f4RD13xhlVAn9aENqaNp9snNvosmgj0yTWM/vq8qkdSSAfs8=
X-Received: by 2002:a05:6512:12c2:b0:549:9078:dd46 with SMTP id
 2adb3069b0e04-549c398613emr1113102e87.43.1741968949238; Fri, 14 Mar 2025
 09:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306222359.797855-1-Frank.Li@nxp.com> <CAOMZO5CL-qQSHuSoCtb+f_mqNG8vu4tTVDi-ThoHq+m9SeagxA@mail.gmail.com>
 <Z8oqhGmVOBCPlJUI@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8oqhGmVOBCPlJUI@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Mar 2025 13:15:37 -0300
X-Gm-Features: AQ5f1JpU2myyIHkRjTA1o08t3hT9TDTNqBiNNH7ei9kP-eOpdOt4OgxaTqhZts4
Message-ID: <CAOMZO5A9ggneYjfR=R4kY7DY-BC2pMh+ayiPEtOTOipCdtBWvg@mail.gmail.com>
Subject: Re: [PATCH] ARM64: dts: imx8mp-evk: add ecspi2 support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 8:06=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> Thanks! It is actually to get spidev. From commit message, I don't know
> what next steps should be did, use "rohm,bh2228fv" or other method to
> support spidev?

You can add a specific spidev entry. Take a look at:

https://web.git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/=
?id=3D10254a6c6073b0be171d434a3aeeff0256e59443
or
https://web.git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/=
?id=3D9783da2384c5623d376e4641bbce9339be1001eb
