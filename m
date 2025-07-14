Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5351253B7E
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752510097; cv=none; b=pszNhle3laoU48fGo6PaHNYz4vcMsLDxflRVigZilw4/stLZEVao3mMX395M7ddXi+axVr+Ww07QjELBtmE4o5B3ovOaSrgyF0ugTOKelJVIjp3DPOe5cddnxlBRg6XNN0tLZK/OGcBcG514upwv8bS8kek86yjbEkPXaDV55mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752510097; c=relaxed/simple;
	bh=XjvqmAKiMsbfWeDFcAZa4/uUI+i93E+juUAjbGkwaZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPSFarXjrQf4HyaBNKcwMcYvcjEz4Ryx8M/HbTu0BQYNH4ZI/axyNB8VasV2Z/mbYgA9F+rJgvZ6aD6Z9UWGeVVFxK23o0GaYO4miGxUkZNy98rkLUzC8WYtdmahYry/pfdN6yV00Bxjt+8nYhAxp3aeipxWO62ZhRwUiJzDBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ML6SudoO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML6SudoO"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b3316160so4831460e87.2
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752510094; x=1753114894; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTJbJuAYewCnYP85dvVNBBoh8mXQ2CM52g5B5kBZ2H4=;
        b=ML6SudoO2YyYtnTtgujzz8WA0gdqlkJAyGjR67gUz/dSnCF6FSMA1H9GIFL4rt1S8p
         VqpxIMgKnec2ihFNlWCufhCEbuBUOP5BxaDEQ8PKN662z6OUYVlzTrFl342NBfY/Uex4
         qJ/dOoqLC4CKrx5djpda2nMst8PRnnT+3Zgs49Aej2huJF4Mzsu9yK1oG+tOF5FafPZG
         yJLJd1TuyJ/YCVFpFMCOvZin3x9Z21LMTxQD/QHFBh3t/CkUCB3gJDv/pv9RsCQUSk7C
         i92vu8/uF9SzaNWSAd6++Iw8UkdD3KjBLOdNQmOZWC3MQr/8uD9QK/o8lIROS7exJPC+
         wmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510094; x=1753114894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTJbJuAYewCnYP85dvVNBBoh8mXQ2CM52g5B5kBZ2H4=;
        b=qJiaJx9rNk7LnUIrD+EKhoTXHI1Ghg/Xsnns8+Ulwo7v0tocvdzxxMAp/1evxc9pO4
         fzm7kaHYsaKYoMyUbsTu2ga/ilg5QUFP3ElpaIzZ9Xwc5idwc5gbRZZ3qqtp+jQ/D+UV
         RzfgXqrzpSepmA46oEdF92f4tXu0OOiPN1QSvW8gHQGERadUBh3YfqTDEr//etJBSBmP
         kUxcz8lQRX4tgngoTE4vX8M4VI0PK9iqGCOltRbBWhhuwm5jnGVJ241Cp/iYFILLjACb
         cA/c25mYVyPEvSaPrmPfQV19usC/lMQK8MubuLBKtA9+YpWHFa0KWalIebLBplrvd4hW
         gFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqwrcmLRXxbICD3JynI/JcrGx4wxGBN4XneMyTESauH0Gssh1J/yDMbu3bcpq1yEJwE+M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGa40vvmjlIUtIxroTzryNWQAaMfOheqibrGCpTfMPWuMzZyHH
	sVohvQjEAakDGuADNhS9WGHTC+PNqgkkg/01Y/9pgfbgDVQQIfjxTJy/LigJB12yEnTdFBFu76d
	3CPGIRPncCsjGjWztTKfCzFjctZfl1EY=
X-Gm-Gg: ASbGncsjEoP45a2EZquxNgeRTxP9zqbq+ZmtaaXSy01PJmHZrxfJg5tkV9pTTwvkrX9
	t3b0F4uUhUkjTh6V6HYJGF2x9nsGMZmepe4zfaS39l6Pzi161uFk1BETMURFH45K0c6uXDzbKwB
	SFRhuoWbIB1dMgpp1JEKRhxfYrSzKKqiACINt5UMLh0lCTMejni5a6ohAEenKyW0Euf3f78eAjx
	ycH0vFvKjjsgq0N9FhMMCgOEsFL4GO5yyu4gzA=
X-Google-Smtp-Source: AGHT+IGclm87ydSL49+QzinPSsQrejdcAIdA+dUrBjk5YaRkXcD87gn+2kE9WiuvkWEf0ylhE8sXm3berCKC28FI1hk=
X-Received: by 2002:ac2:51cd:0:b0:553:2ca4:39d3 with SMTP id
 2adb3069b0e04-55a04648aa5mr4435881e87.48.1752510093600; Mon, 14 Jul 2025
 09:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714141852.116455-1-frieder@fris.de> <20250714141852.116455-5-frieder@fris.de>
In-Reply-To: <20250714141852.116455-5-frieder@fris.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Jul 2025 13:21:22 -0300
X-Gm-Features: Ac12FXz0bznvDGRsXPKyEt2xRl2QsdOW2ikUFXHoPrhlON9BuiFs_wNXWUtrWMc
Message-ID: <CAOMZO5AR_6wODDES4ojA0KYmN7jcxuWgicuKBN+hy1e0EE=yiw@mail.gmail.com>
Subject: Re: [PATCH 04/12] arm64: dts: imx8mm-kontron: Add Sitronix touch
 controller in DL devicetree
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Oualid Derouiche <oualid.derouiche@kontron.de>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 11:20=E2=80=AFAM Frieder Schrempf <frieder@fris.de>=
 wrote:

> +
> +       st1633@55 {

Node name should be generic: touchscreen@55
