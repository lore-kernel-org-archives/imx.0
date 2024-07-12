Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4281C171E74
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796147; cv=none; b=a7g98h+QQoHEvopajBLworIIjqPvghvIDN1SKrGrbYWpGdex+jZEY6hsINWovAor9Qwm+VoBM/W8W+hQAEZ4a8U2XYojk6raPC5y0QlMCAGwYJ4vRS7TqK4Sm1/E0IC8NbOInwMg5z9ohdMlnlwXDgmuH8PDwqsc0Ui2mqxKYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796147; c=relaxed/simple;
	bh=G01k5MRoiTRzlIXUWS5KbwvvBH05cutX2uFnWNAanTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAi3CXNAuxB8QjPNKy57SnFjAxCArwQ2y6Pj2k8jrFrjbjjnwRX6lfOPV9hFAMu/CIoQV1MckTjP/snQOJKOV2eK8UEdtAXWMKAVehU1yb/FO8WoIr/tBjly6rqJl8h2WoNj0oRvNdJoZ+X9UOg6ola83Q4C8i+jFQ0hDaoA2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbeG8Nd1; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbeG8Nd1"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee86c09963so1928101fa.1
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720796144; x=1721400944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLYT2mzC0BUKlvW0kshtuuqLZAeQIwL6GMBmaptllbE=;
        b=NbeG8Nd1ay0b+7x8QCCsYRotI28odwbXdy3cmihy3QAIYYZIw1G/8BIX71hMi+IJWK
         5OL+ktSCtqnHYoBai2bozlG0ciMhl7eXUulXZmkG91lqh2PVMd9HRDXUBzS1FomLxRXE
         KSD/YIvq+TCW+wiw7oqqHT+01LG67DFQvBkmWExx8VEPaL2ioXW9h7ClWtqchvdpvmJ+
         CmiCudNtzeaZEmL0fEjo99oTZ4WoPxpRbGfG9JAHPtJ4R6cUfzeJXZRoGj6Ban6lOWGM
         s48GAfsI/r/95IuJwIfvtomnn/kpYeXOrP8dYhhIDFlYqGLqkzplrieNxespG3x439kY
         R9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796144; x=1721400944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLYT2mzC0BUKlvW0kshtuuqLZAeQIwL6GMBmaptllbE=;
        b=PS/UxfUcv9A3BVgZlf/wp2bj5CKOn4iGpCt5H/ZOQNbtl4JjaNfl+kJzEeryS+jtO0
         vrlZC2FEUgO87KkaImJyXDPB4yzD/2bO+AQgZ3UrTw2KYO4/jGzA3eLPuGrGvxyCyZY4
         uiVLdzGWtBuI2lyAZJ87ejEv4Rnt/VaREc+f5EFdNUbqFiuDLY1L/EWp/WY9Za2jiz/Y
         enVpvOsJBJU4RxGkT3Fkyw5O8Ufgi7Dk6csv9sUQo1q3ycDBRtiDqshTAduEg4h1nlX+
         6Y/gw0QccY4Lu6fC+kvGr+EGIEcHeSXvta1qMhob4B6sRLRKdSAREP87/dWRJp+630yX
         XUUA==
X-Forwarded-Encrypted: i=1; AJvYcCXnHQIB8VHN8McxDkn/epg/IYZfn7U3k2vbvN99aYsQT49E+gLGRt7n2QvqhmLDXvD8liysCDu1tHnbg/khEKlNeN/6
X-Gm-Message-State: AOJu0Yz5HY6fHQvG13FAxGEy0CSVvYpJc6JESpiRVS8dqnlmkm85VsY7
	uTA1QoZtG/l3zMsduOXkTEcsv0qiR7dx8NUeQ+l86YrAur+Fw+2BfmaCkVx071jGoL/W4WmToeO
	cuarO6esVFF3lpspIftpHotgAtIw=
X-Google-Smtp-Source: AGHT+IEmCwa8usCUTHkBIv7Mf9zJRQM2XeruzJzahcPkwF8s6bnE8YVd2+VLiFSAqpzPPKlFYwUoErW1ogjMY4ANU7Q=
X-Received: by 2002:a2e:bea8:0:b0:2ec:5258:e89b with SMTP id
 38308e7fff4ca-2eeb321c561mr84830941fa.3.1720796144123; Fri, 12 Jul 2024
 07:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240712143908.158752-1-shenwei.wang@nxp.com>
In-Reply-To: <20240712143908.158752-1-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jul 2024 11:55:33 -0300
Message-ID: <CAOMZO5DvN7ZaL64Wun3g49ewYQLou+8ASFAAp8Tt8SHGS3adnw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx93: update default value for snps,clk-csr
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:39=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
>
> For the i.MX93 SoC, the default clock rate for the IP of STMMAC EQOS is
> 312.5 MHz. According to the following mapping table from the i.MX93
> reference manual, this clock rate corresponds to a CSR value of 6.
>
>  0000: CSR clock =3D 60-100 MHz; MDC clock =3D CSR clock/42
>  0001: CSR clock =3D 100-150 MHz; MDC clock =3D CSR clock/62
>  0010: CSR clock =3D 20-35 MHz; MDC clock =3D CSR clock/16
>  0011: CSR clock =3D 35-60 MHz; MDC clock =3D CSR clock/26
>  0100: CSR clock =3D 150-250 MHz; MDC clock =3D CSR clock/102
>  0101: CSR clock =3D 250-300 MHz; MDC clock =3D CSR clock/124
>  0110: CSR clock =3D 300-500 MHz; MDC clock =3D CSR clock/204
>  0111: CSR clock =3D 500-800 MHz; MDC clock =3D CSR clock/324
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Should a Fixes tag be added?
