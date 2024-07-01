Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FD63E
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792622; cv=none; b=JI1RI+ubWy5kOISs0yxXBN78bjmj7y90lbLNM4KE+8XrGBBcCkx6jWT8IbBLsdyL9hTd1rolazjr/Jb7OyQAwhhlShL99QahcLbxX5XjWo/kefe27VdE82w7SakGqmK9QoNS1+H3rdOPpbumIGn8lTJ8HXNycuU2lQIV+iwnxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792622; c=relaxed/simple;
	bh=nnClZwL7a9Lo3WGW0DdfJENLXrqDwfN4i6NjSsXCfhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YN8YqVShrnVpJyp2VUC91y8c+cMvRhS166E2LtJROGtv4UbHdMMqfpGOGxZisp88YHE22GYwIR0F1pM2G4giUF+qvh43hLywxlpgL4RN2eypAnvua9u96gy4g58yp79/coyP6qVR7iXDCz7VuQR4MBy4KPpJ+vhCI0tMVr+BBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuqelikA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuqelikA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ce55db193so288710e87.2
        for <imx@lists.linux.dev>; Sun, 30 Jun 2024 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719792619; x=1720397419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2zppEwdRUP4lBbNN9dpO2QH9XHyegI1cIfNKuSEDlk=;
        b=MuqelikAAS/O+tJ+KLZgcKNFUIh2LDMR/9zYpIypT7a1U5IgWSIhdrk/h6BHdZWdnn
         litXDQjB/06nPzHeu7hh4KBdYYn25/ZKyBXdOOBYG1Jf0WpWP5aw1Tv2XIM4CSnPHqqC
         SUdGwYMwz+wZBgSXzr9VvbG145aqjTAgHbgFHm3dr6NJvMooqHKPadcZgzVL8/0ePilq
         8TrrBudOh4QW3Pu4ENVIZfbse15DweDfkmGa3LIGz5SfjyDG5VSFv+FxbvNvkgOvRuTe
         EH+WlH0eqzPuYyQYSTrO7YzYA4JNysK2uu0D6VqRehOS9Rx4Hs6UuAGqpbcA5UNsvme8
         BuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719792619; x=1720397419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2zppEwdRUP4lBbNN9dpO2QH9XHyegI1cIfNKuSEDlk=;
        b=V5ffGdVbamge/060DZL4HtCyGWQJygL6xrjCFsRzPR3eyJlPO5Y7LknI072NDQ7ZAC
         OIH5DgNFdGF0W69bVX++VH88weJ7cAW5jMt8T+kPEe9DUWoY9BpFVozF1UmGu7m4LtUc
         Z26Ui7WtGM14W3cKK1vyvqQ06kRo8b/aSYlChY6Og63yDXSxzCp2xTmdtoZ4PhHNdbsz
         hPHb8SNf6+WP27K6VYaElIWS2ijHMcLCB+VejvrLZnjmoieKCXbn82p4DlCPDCvxB+e7
         DHgqgqNCXIi77fvNbvrJQJRgVDghdr59DxBngDLvpPWZAJ0zKfSQWWyU23vnBOaTtyfa
         472A==
X-Forwarded-Encrypted: i=1; AJvYcCW+0Bic4DyIoVO2X8obbjzHyahW839JgCq6Z4a6UAfu37KNTONG2AWxwZeWTbV0SDiNM1mZ39yXMvCzmRJbOXt+rHiI
X-Gm-Message-State: AOJu0YzpCXKyrg6x+PyBHpsC+3jZEel9gr6suGiz1mb/8EUO57XX9xpJ
	9/WhCVe0Ko2D4bwkEI2NghF1c6uSItDJmL2wZEtiEaCrMXZdNsNRpTVKf03FHg2ZSEm3lerMyOq
	Y3pCjN5DQExdA4eEEfQEsszJks3g=
X-Google-Smtp-Source: AGHT+IGfcLlbEM4SexKB3qvZxwtdSASEeJ4vyW8XH9MyjF6BNz8i77fKusEhzt5Z8hmMXUodZLIPP4wsLqpBG8aZWlQ=
X-Received: by 2002:a2e:a7d5:0:b0:2ec:ca8:4897 with SMTP id
 38308e7fff4ca-2ee5e6ca046mr27574861fa.4.1719792618943; Sun, 30 Jun 2024
 17:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com> <20240617-pci2_upstream-v6-6-e0821238f997@nxp.com>
In-Reply-To: <20240617-pci2_upstream-v6-6-e0821238f997@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 30 Jun 2024 21:10:07 -0300
Message-ID: <CAOMZO5CpFB4yuZty6zkX0KyGfYvXyuSnmeJyH=pn7DiRPmGxJQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] PCI: imx6: Improve comment for workaround ERR010728
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pci@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 5:17=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Improve comment about workaround ERR010727 by using official errata

This should be  ERR010728, not  ERR010727.
