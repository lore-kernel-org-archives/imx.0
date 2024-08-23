Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7891EF1D
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382216; cv=none; b=dMqjAu14SptCH9K8iFMSZU7TDV9jeHyolK/0PA+STcxRpFuMNyul/LsX4BfsXoc8g4ypQroKCLNDwxN+4ekHe6x04dvufH2mk9+UPtsIgppEFFYYvjoTSiDNZ/QtYT0gbpBPWSfmI/uZjLCMklr9Yw5MRv6RA0SAreeHTD6RVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382216; c=relaxed/simple;
	bh=OpUizcF5iX++1eqZ53wXDHtHkp4ptwu2/RX1CoTTmNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqqrsSxUgT7/lQWmsSHeOcASgGpTHUJgBoX1jjQIizNaeTa2e6aOz0vCCypzlUHgo3SCHwFAlpR1Q2FonrMDHw8BICLGMQWJBkiT4j3HklzMFc1/GTOuFd20q6djHHTDoRGNR2ebp7p3YKhvEH4GM64L1JPeNgES+VDVsJSMfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO55nUD2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO55nUD2"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f4f2868710so6806151fa.1
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 20:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724382212; x=1724987012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpUizcF5iX++1eqZ53wXDHtHkp4ptwu2/RX1CoTTmNs=;
        b=JO55nUD2Tn79MAxp9uMWUN/xUyBULjUtfxJoq41/ost9r8Xs7tWi14pgKc0285Di2U
         pGezGqV8GB0cadR6if7RuOzN1KKm7b4UjpxzHIFqGVPuUhk+RHtW2rv7zK8dWkjAAZix
         1okdJMKKDivCEBfGGOx8mqw0LEuMnBrTRMHnFWmYb6owRsSGcj8oeQppmkOB/F4Ymbpd
         f0xbNai9Y9LiGgzOWsVuEinh3px93ZOEeYovxRDdVQXkurr1mjt4ll6nOc9Wv5GAjMiN
         uebxooDPnoC5+6p4o+NMQ5+pH861eE4B8CwXNCatefHD7r1Zcb0WGu3BI+U/oIqLwa9X
         BGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724382212; x=1724987012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpUizcF5iX++1eqZ53wXDHtHkp4ptwu2/RX1CoTTmNs=;
        b=pE9PdIWqlTjF/P/Rd3+uGgFmjOhxXEFpa86Vk3/QlNbxPQ2UOk0SUzsabyv42Cbjhr
         yk8V+SnjXCV9IcnbLaI/tzklAru3snl5H7Mup04ESMir1XVRgELc2LVB3cgWbifwkP37
         5MYJcIearNppoeY4EYlJotwgELloLg9yP6Yk0lggSPvgW5KlJPb4c3NaTENrX1EUmnja
         95w578tweVPL0MCz/47Qx/NipKFnG7s+lDJxc9yQGr9kX2u2aNXb1mS4GPny4BZv2iwX
         NczBJUCA9ZmbvbRy/n5MiaSHphRfNTkjCSitXeug0m2dIFFBgDBLDnDVexwWKt0S96Qp
         OVFw==
X-Forwarded-Encrypted: i=1; AJvYcCWUCvPUcrVP5/5JsdIq6V3pbEExz/uxG/0KSRuXLH0pGiVsmhEmbbE591l1eP4az3QA56s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPQN+wdpDCWTdA8DUi2yEzduVd4rE/e0uBgcqUMBsX5SoW1MXU
	8lNHi+IxZluV+Kc1/2m3OB4qZyMnG1Y/7PzRSQpjmzSQNpwmKS7XpYGmHoHmkooRMG1Gngw66jg
	U1qQTRsGJP8aAavKL/FeurO8/k9g=
X-Google-Smtp-Source: AGHT+IFZaVNNIfhPnYJ8j60zWzA9Ojbce9+zckAj3ipZC4+X1F65rQVGMBHi2Pgu4DqPCK85AMDX07WkOMChwVZOuKw=
X-Received: by 2002:a2e:6112:0:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2f4f493f0c0mr5419161fa.37.1724382211399; Thu, 22 Aug 2024
 20:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823021257.1067054-1-victor.liu@nxp.com> <CAOMZO5AN=yx5RSkVuMrym1QF7s622gm8+Qnf09r9mgZKr5sypQ@mail.gmail.com>
 <cca0af80-8265-45dd-aaa1-e28887f343f5@nxp.com>
In-Reply-To: <cca0af80-8265-45dd-aaa1-e28887f343f5@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 Aug 2024 00:03:20 -0300
Message-ID: <CAOMZO5DqXQD8Emd2sV1_GDcDMDmt0kxtvVeOn4nQftnz=vL9sg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-evk: Add native HDMI output
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:50=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrot=
e:

> reg =3D <1>; is in arch/arm64/boot/dts/freescale/imx8mp.dtsi,
> so it is not needed here.

You are right. I haven't noticed it was part of imx8mp.dtsi.

I ran 'make dtbs_check' and no warning is seen.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
