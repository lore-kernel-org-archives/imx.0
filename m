Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952841A6832
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247541; cv=pass; b=tJFwUBJJXGeYH4shosqaw46LR8eUw36EIgC265q9OHm0puwngse0vzlVlAuS7MtHqOM0uVNwkG8NKQPIezp9tVpae2jl3lY7asolq3RUhoI3WkHJbOt7W8ijz8M/X9dLt7lkcPCQhtyLWQPbYoO0NVMTbyAWLeA4TGUozbrq6QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247541; c=relaxed/simple;
	bh=Pytt0LS4QTbvNFwjxMDR4iUC6e9Z75QMqP7WbaGLiu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho3aJcaWgGkEnTC8/1y+zyWNxryvL+mGTuJmDtY5ys94Uv/90rr8sg7Pgxce3VI6IuAe7BR98OW7fuqTlVVgiKghbzm9jkC4+3tsa991wT52rS0SiY/9LX9wMGVASOKw+Mhh8Ykc8dB8vB+OpxNXrBB8FirWnoAwB5082N6NFb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwvOmWI+; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwvOmWI+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a3066b68bso1255311fa.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773247539; cv=none;
        d=google.com; s=arc-20240605;
        b=JEvG/x9iANPE1EzIM2ErwnC789aEoRUrnTtC7TMagvWpfrDkaJLLtCNRYODP6C1c2Y
         RbTawvdoSvJQQ6BwpggSzJsl911Fbx9riWxboIUMhyUOi3R9OeqKGay7yWx9U1wWkd+k
         iSzGm6INiDttsflVMdR/MxlgvOZeDehBGZ/w+jY1tyS8a7Xm1p5O/sZ/Oj5I2yRog4Ht
         LHByQQF1hoEejDi6N0YCNhJqwG9YvYUeqarA+oN90jI2Co3vjAu4/9gFcEHNZPici1Kn
         b0tmMDWttGj45sPFUYDZgtjbkyJlKVHyA/jKxhw/tF3bbfLYAp5aIBgOkobSBKtvZuyn
         qDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        fh=gGfCUqDU2JgCPcJS7XsAj6ZAVDJPWK/UXo72qqGUGqI=;
        b=fz/EjwiLyPAqrjGbT3GSDQzv+zJwM1qzBUdDJ0deJ0jzcYEpwtrTzRgpA9DHt0vfPf
         3eYEq3DQhMUBiRnZ1rKGwuGiNgui/ESLgNCs8zqcvVLMh1MnNFKWjvsuXgIj1jNK+4cL
         e5bD19RUWKxdwA4v/qWNitCxFtG9uN4KPRaQ4qhyG3OSGmkkygPe3fbzURf2G+UyEBbQ
         6HLXOyxpZHqTT0tmDrtupm+ePAZKUe2pQinO+oZZFQkZIC4y56rAr4NDIYCtxV9UrnUt
         cX2i9EfGuozI3p/4T1Gw8Lc//uYtonlNOn6CVoDH74zBZnEcx5E0tE1BtSVKEHDn0ABp
         y2ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773247539; x=1773852339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        b=fwvOmWI+5WiUus6V4EeJxBaURiJs3P9DkujnuIpjEFgIcm1DjTtOynkBvp1680f5No
         iFUt1UsLyN2oj15s7HZEwKeSj5b78GBCN5BD5kqe6ZLldaIHdYw2sgw2yanSOTjZWAin
         3sW0///Vy3bmT62qxpvQDvn9nfVZI5HroJ1r8xY3HuUvUEuS/TxxF7wFgJCZ8oMhLoO7
         WJ+dy8JtneCB8mcQKtsVGr66TxlcfnQye4+6z4t/2qCMScaSCphrao4VsX4fjtdA7MBz
         JZlK58AVLDjV0BKzefr5jn3YeVwcjujevEUzfsLrT77z0IH6XPpVerp9+25OoK/wCc4P
         pfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247539; x=1773852339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        b=LHeVPB+xG9oC32SzRw9LfLWvIMTxY40KmE443oAV5xJYF7Qb+d6XycHTrBHHOPjFxg
         cWCtX2KL0H7M+2dh29XB+e5JzgBYrOJD3vHvXnic6mxCJjLRxwJdsZpPYBTWF9lKxPpp
         OOuke+V5sX7qG4cx39mrRorXg6BG9aib5Y8ckkj8DnBTmsLb/VJLO6tyHvtJMQYL01cM
         a91LfEOPfEQjj64qN+ljLz27dJwk7JuvrrUOsDb8FB0Un3eiU2XFbFfE/o0UXyV9OhpT
         5KxRmg+uuE0dP5a3KvqFGQrrrQ7/QLqRoxMHOiZfi/yikz90WTpKRWOEScwl7LNpgT5c
         jmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj9JLYMU6aHuE7ziim5Zxgi5sQ1Me3tYG5nAX4+dTlNLcRZoir+Q17ffce0BDGzSt0HmI=@lists.linux.dev
X-Gm-Message-State: AOJu0YydmPdibZqkXlsu/L+AT6fKLiaripZpZ+vx5NGpFTnfDh2Zar+F
	s4NwvrKk7EpaS0Q794bamjWbhJjf8oslxg1p+sBKH9lszTv26XmgsZ8SSEPVhXN5JevcydNSjoM
	cKCglfiTtGGcmp7kSAjsDXDfs6WkBook=
X-Gm-Gg: ATEYQzzMDd8HsjpwJIc7tuWt6GtPA4auQ7tMrrFODexkvj6ZgskFlE7EXZsUch0rIXg
	NGWcA+iP373mdhsMy2MkgZ5Cg2xN6jDv6vSx63oydhgUE4M1HOt9C5rZ0tzECN7PG4bxwoyU58g
	/PdnDL2PBAK6vlGV0BGZeuJBnJ5JmQ9nHh9dYxltWGLHQBdA98c8FKEgrNJLf0qmpwtrP0EyFX5
	r4J2dCzB/ZQ1L2VInzNxjG7U76to4wfXSeVymrQo6VFd0lRMbQdq41QnaVsZX0R6Pygiv+WrdG9
	ELSMze66PgBp4Rfs8fhDUMb3M6voXyIq3EHXRywHLOmn0Nzzd+Zh3CnBNLzxDz63c8XsF8Y2
X-Received: by 2002:a05:651c:1605:b0:38a:4de2:85d7 with SMTP id
 38308e7fff4ca-38a67dc9fbemr12968571fa.3.1773247538651; Wed, 11 Mar 2026
 09:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com> <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Mar 2026 13:45:27 -0300
X-Gm-Features: AaiRm507l0YwGQ8hPR6SwFHiZ8rbTpqpePPRrK9orbsaemsmOMG7afnYzJw6ou8
Message-ID: <CAOMZO5CfB9N=arxsxf5V6pisVMM25UP9hvbbFL7R-R7sA6xB3A@mail.gmail.com>
Subject: Re: [PATCH 05/12] ARM: dts: imx6xp: Use undeprecated reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 1:08=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.

There is a typo in the Subject: imx6xp ---> imx6sx
