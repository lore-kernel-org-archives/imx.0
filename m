Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420339FD6
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711750139; cv=none; b=urfUsxtKM0QSS1ufmVyamQs3jnJ6FYGxwt2a+CEBx7rgmfPN5MqwmOZ0Gj9QIOXJIK6KZqsHpgXE/ZLOiS17ZLWrMIY8m+/YH5HSfqNyye/caL3V6U79mt9MoA4eSUfJ/MyOIJmXtVB4DZPF0mFlSU6qgzbMK0UZ/hpP6Ey5Y9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711750139; c=relaxed/simple;
	bh=y7G4DYNMOFyxffVLJMZBeVXO/WaC4q6q2VAU4bC9rXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRJS9CZzOErk7lSHS82fZX6LaYxTqV/J4P49IujMC9L9r9ebcUgmC4WuItL6GfdCuk3j+jDs21Bg1k4shwaLOPH6U/NpsFRV5xqtbp9gDuYcANgl2HALnJDCuw61DpsOeLLwonL0VhFaBBm1s3WICBC0a3NP3fWXZeEh+FiTTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3TBy4DB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3TBy4DB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-515b3077d09so2532756e87.1
        for <imx@lists.linux.dev>; Fri, 29 Mar 2024 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711750136; x=1712354936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S66csGSC2x765yPT5DOSH4bfdTHAf2X5g8oHEEBVFJs=;
        b=K3TBy4DBX4fppWRDXXC0WDooBqwtZ4egmNRf1pbJdSXEDbcXJeJNaOET+Mi/DOdR3S
         8BdkBJKiXBVjqBYGrn+lfa9g0vrsmcb65uqjti6uqhPaLMkTyYcPVb1yPQNhyKy3Hs7g
         N+/w4/DtThxmo4MuvJOR36+9hIMYdPw5v/NCrWpg/Yj1wWRq/WItva5SmPHjVNs128A1
         1KAgpMhP5LYjg4V2JJ8RIyFonqK7vUdgIPHOrr4l6Y6wJTyQ78ELtZAJ5AMAE1xAKidf
         qk56DpDejKvmLbHBaLfuGr0romRBiVW9l26jfnvlFrUundFCcVebwDr0iNq80MUTs7B9
         /FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711750136; x=1712354936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S66csGSC2x765yPT5DOSH4bfdTHAf2X5g8oHEEBVFJs=;
        b=PD5dC0Tw5QBXh53iTrHWoWZYt8XXtGVwPcxOScFWYjw3xLrDuqQRoljSqNgZEyq/Ha
         qRmK0vmzrTRDeQgH+aSWY9mZc3heBrMTXZUK24X+5Ih7ASaTK8/UWHNuJv6siZpBEeU5
         mLj4nHyB1MgY/EZsPeNDPvR7IcTFHetM8knUARSZcLgsN6ThzRYkvWpn5GfqmwCFBe/s
         Cdzm5MVFjeoXmDk6TNfUdc5jxCLyqS4keetQsl65ipqUCxqTMZZlFoxqigx9WQJlj4Ap
         Y2NsBmRT7UGtiv8UUFu5Z7S94FQv4BKDkutkp9iaaSIgs2lrpfCFWI0eaW/vq4SVnEwm
         WkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8iqA3Qho25UIzMj9Gd9zCnMzfOZ8TDR0ITS5nlT9GXA/7mdJjxKoPgSamrfOWMcUhf0yqWcABA04VfdZLPR1qzSV2
X-Gm-Message-State: AOJu0YwtPpfpXSoeuRI8bg1XB15TzPmkiRV2d+t1r/rybWKdoZBBQuk8
	2lPsJacC3jj0KLTDCRTb4LAXda7J4abVG/i88ANm3kXGOPTF1d8TicMVj5MPmqPDYEr4cLN1LO8
	Uy7LmBz3E0/bJ9PJe6nWCslCiNAaJNUm7D7MnEw==
X-Google-Smtp-Source: AGHT+IF/i/keKyUqajH+MNEiAQeWqJNezNRGZW9H1GCKnNaMSID2v8bQk8oNYVdfDdGN4IlNDcT0n/51mjCqfqlkJlQ=
X-Received: by 2002:a05:6512:344b:b0:513:c632:24bc with SMTP id
 j11-20020a056512344b00b00513c63224bcmr2380546lfr.35.1711750135729; Fri, 29
 Mar 2024 15:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-4-gilles.talis@gmail.com> <147dfc5e-91e5-4ad4-b818-f6717e62df45@lunn.ch>
In-Reply-To: <147dfc5e-91e5-4ad4-b818-f6717e62df45@lunn.ch>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 29 Mar 2024 18:08:43 -0400
Message-ID: <CAKcgs2xJ1pgzuARV+qHgoqDXi7uE85FbAiGRiT8uwT=BM6yiCg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, shawnguo@kernel.org, 
	festevam@gmail.com, alex@voxelbotics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for your review.

Le jeu. 28 mars 2024 =C3=A0 18:11, Andrew Lunn <andrew@lunn.ch> a =C3=A9cri=
t :
>
> > +&eqos {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_eqos>;
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&ethphy0>;
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             compatible =3D "snps,dwmac-mdio";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy0: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     reset-gpios =3D <&gpio4 22 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <1000>;
> > +                     reset-deassert-us =3D <10000>;
> > +                     qca,disable-smarteee;
> > +                     qca,disable-hibernation-mode;
> > +                     vddio-supply =3D <&vddio>;
> > +
> > +                     vddio: vddio-regulator {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                     };
>
> Please could you explain what this last node is doing.
>
>        Andrew
It seems like this might not be needed. Will check that and fix as appropri=
ate.
thanks
Gilles.
