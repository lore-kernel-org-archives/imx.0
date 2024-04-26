Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA21148837
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714146986; cv=none; b=l42wqk9LZEFpAUukdbdxKsSopODTP3xzFumJfaqwei+efP7pmLG6rV3KLy80pLchrvmZ4CPb2DFBYM7arCVV1G/MN0DbpsnmwD6ojCJh3DPLyPSYqQxBmUuU6LYKD1/YcxOCV5sao0fPrOyeFgzwN1Wvq8e0Ua1Vs+oXUgcut0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714146986; c=relaxed/simple;
	bh=SPm23R+pERREX2KPb30REziWklWi/jFqJN/iR+KD6AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpF0Ns1Wt1CM0NV1gKgg8XIKpaF4je74yk+e4lD0pghosIPVFRa3ujF6ZhjxZFpOw8wC+3GeAwfsDLNOqUZPNbHHhyKDn2ndA57a3AWCjQMD0KIQJSbi/sq/U5lgZN7P6Zg4VF/U52NXX+NwyDasjXIiAu0JaIv1R49hMzXIUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG3Bx2Pv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG3Bx2Pv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ab936993abso596360a91.3
        for <imx@lists.linux.dev>; Fri, 26 Apr 2024 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714146984; x=1714751784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt6fM2J/0v9iVwGVtQ/PZn4/j4BB6la6XibiFvi9sc4=;
        b=BG3Bx2PvleScwCxSppNAinzYPA51exgyLZK/ouc6EFms6T3VwylsAW4mzPd56SJeYw
         fWeYrjbsewRT99qsivuadvSgUJ4ZRG9gCrSmjxzoaqgXjF3lJL2NEpl21HKXIXCQEOdl
         mZzo8b3xXYz33pcURKX1GJMss+BYYXDKX7clBzQ4zwTgX34vYh3odimNv9TdMKt8My2m
         KqCsAzqny8SPl88wTCnE53YLK5RCvrv5C8P6MOjj3Wf4Vtd30YnY6S2ZCFDshv7jGBYt
         WZYji5ayws+bO2RcuKPW3kulgtmbPCmTTkMhN3QIGNknK5VdMSZmwxzYFZcUD7r5EK9P
         RhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146984; x=1714751784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt6fM2J/0v9iVwGVtQ/PZn4/j4BB6la6XibiFvi9sc4=;
        b=JOzijkwsnhvn94Mak8ZmwxwKeegwZa6CvWm1AHgw6TnN0prJZEfZuFNIenhyrz/X6L
         VytKl4NN1W70NvGpZ9tPRrGZVBTNf0Z/MEmypQ+XZ/qlfhCgmiUWr8emv+GpRnWiScep
         A5D2aYY1LISQ4ZRD1+NoBwxCFYqJuKjXqMyDbe+HOiq5XZ8TWVSLx+e41K+0e9V6fY6N
         MO/a464ptzQQTqC8KbAIicre70qD9ozqfdKznb6pnB4avtODxUNU0qMCyNySk0d0g9qZ
         8ZPyKTmhOdTdFE+7aYBE66gYBjtgRxUMRvDzU3TPV2tgcz1Bsjq14NGeAJcD8LoioWrp
         IYcA==
X-Forwarded-Encrypted: i=1; AJvYcCX6tenf0FVIZnhLHzzO9ZPxriZ/Rr0PqvGZC6im98X/mUmPaqw0yYy4koIrJyFkFdcPK39YYEOb1pyxFHPyaRDpJQxR
X-Gm-Message-State: AOJu0YwJdlAMxOdpO7C8Cs+vlFFsH4k+ajthPoW74nSLJMQhk/a7/T6b
	uDEvjKRbivc3urSeymvbicem4S5O9a6XP2pPvDmrreJQM6c9PM6LN9Z1W5OT5ib2kubZBB11Shi
	u3mH/AgWLmUJoKUqic6Iq+xt8NTrBtA==
X-Google-Smtp-Source: AGHT+IFSQ5Fxh0ege+N4YAigDlp6nqTb/tmi6pOaqlOwOkNXKsPEQwESVg1WwYcIZJqtiWEX3bEe4M/hrS22PvVApa0=
X-Received: by 2002:a05:6a20:1f88:b0:1a7:91b0:9ba3 with SMTP id
 dm8-20020a056a201f8800b001a791b09ba3mr3074443pzb.4.1714146983761; Fri, 26 Apr
 2024 08:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426152730.9806-1-fabio.aiuto@engicam.com> <20240426152730.9806-4-fabio.aiuto@engicam.com>
In-Reply-To: <20240426152730.9806-4-fabio.aiuto@engicam.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 26 Apr 2024 12:56:11 -0300
Message-ID: <CAOMZO5D=Ens3f-FnjEf8SDSTCChdzKW3m7LH+t6y6qUtWsSRZg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: imx93: Add Engicam i.Core MX93 EDIMM
 2.0 Starter Kit
To: Fabio Aiuto <fabio.aiuto@engicam.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matteo Lisi <matteo.lisi@engicam.com>, Mirko Ardinghi <mirko.ardinghi@engicam.com>, 
	Peng Fan <peng.fan@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

On Fri, Apr 26, 2024 at 12:31=E2=80=AFPM Fabio Aiuto <fabio.aiuto@engicam.c=
om> wrote:

> +&usdhc3 { /* WiFi */
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +       pinctrl-0 =3D <&pinctrl_usdhc3>;
> +       pinctrl-1 =3D <&pinctrl_usdhc3>;
> +       pinctrl-2 =3D <&pinctrl_usdhc3>;
> +       mmc-pwrseq =3D <&usdhc3_pwrseq>;
> +       bus-width =3D <4>;
> +       no-1-8-v;
> +       non-removable;
> +       max-frequency =3D <25000000>;

Is this 25MHz limitation correct?
