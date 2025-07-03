Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF802DE6EE
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580044; cv=none; b=FpzKlyD3/7jTPPWOEDDqDewVXb+7ZFr3SWU/WH1zfso7keckj3vcgggXypS3raxtBQPB+rDPRF3+Nv6Fp5RVgNvrEKdbEMudDcPOHU4SzcGOZ77sSHTtrnNAnGD78T+FY/xtEJG+FT2e3iEMXIYk7PeE0M/UIyPOFmuDLNtKB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580044; c=relaxed/simple;
	bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7Xj93x1sciLWa4JHUEtHN/Eyo6ahGSQUlY/h57jY1h331gGBEap9Fak5ZSkCZaNDBLeNlxoVr+ZqxBOJprtpQYMDa4ABj3r20SdvW2rxdRpzsmWc6Pnt4QR9GKqnkXdbzalQ1YNRI5kJ0wY3xpSLIw6ItymERGzCWTj5OLm4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mECjTMTv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mECjTMTv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32adebb15c5so2762691fa.3
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751580040; x=1752184840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
        b=mECjTMTvUeKseYjh/P6bAzuNZjYpUOTODrFeg3NzmschGU5roKx0IkaKo8MMZTXdId
         KQQzGVwMCM9v0NxLbJCkoWseELiawEwNZvfdw5xrylSJxDrYM9SXJmA7w/ObVe4v8FK8
         xWIbyWKPE/m0lVkG1QrLy6zQSKY5MinrhDrbwmdlrS8L4Z+MKFJ3CZKImUHVky7umsJY
         noiQnCwIibg+EB/Ikk7KHhouILY7SIUX+N5ITjiSIUk5CzCffbxRrrGzRJMaxxZzGM9W
         kQLqE7qMfVyuymcE4f5/OeD3PwBr/mQ+2sHoIuefgkB9zc7nsKaaJzmHdE0bQlYuD4oX
         8EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580040; x=1752184840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
        b=gsyXdcmFxCpAhjP1sjE0k1T2WCT1Ldwi+bEdRWnvSlnKbKS8u3Uc8ivqre/45jEPIL
         b1ZIWHpYi62g+ycbfHKPHZv5SQLr0fKnPkUV1jST13BP8HTS8NGVK/kFEN56O1uhgujy
         kncQMmgOiWUnKSD4AfZy77MxHhQeEdpp8ZiqFrxp2iX20nT4E7KG5iirFbafP4S6+iyX
         +hXHXVpiq13REsrSblDnSljbYaEwW5ndB7SBfh42QdXum3LotUenuHiOKIIPY+BuvGD/
         SB5ANstSVtFJkK3YDe0wAwnWopBBajbzLxQGHUQ9mIL/fo1HTBlTfsBnI4FRDCR3Mv0h
         4W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfRKdylS5icqH3Ty6fD24m75bmzC0F3WMWsZV2/WvPq1J/YYgi1tWzR7yy4NeNT1ZAXV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOA7cf0qfetlbBkW2XnyTJ2e2eFq2M0squiyLBETPw7F7iRQRL
	SfJKW565IInkkYIBg5gHoMxEg9dq35sHD5oOBPqLjfUaUokBYy6UsWCLcWGHbawrZAV0t41neE6
	0M73btFQ07RJwmsL4Xx9TNQ8+OUFtpN7Rx9TVLLhskA==
X-Gm-Gg: ASbGncuUuHgZWcgCMrKNjcmyl/d8rgO9bY7wOMeDpDBVdvA++e/maZCgyKVkGLw/O3r
	w3FkG+MNzCl+2kh4QULzclgIcBFFisSX7kXNts47v5N2R8W5Y7hAtqmUi8EtZCCuzouqcacU2f3
	ofRmQf0ddlbv4NGDbiw5MMki4/e8bsPqJtrEAUb6/vENgioPW7I+BmtA==
X-Google-Smtp-Source: AGHT+IFOg19UiUE3TiCmES8XgOiPoWe7IXHAEBmzFu74XNzMO6mLnJFytBrmkTs0o5+cmuS3yBGZJGpr3iPUNTe0hDI=
X-Received: by 2002:a05:651c:2149:b0:32b:7ddd:279e with SMTP id
 38308e7fff4ca-32e5a501965mr343691fa.14.1751580040326; Thu, 03 Jul 2025
 15:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:00:29 +0200
X-Gm-Features: Ac12FXzt-R2yT2p2gdap6KBqFivqmoQqCjxQv9f3OTqOhOSRfpfG-x99NP7EpuQ
Message-ID: <CACRpkdYD7eC49n7pxvjvrPE_Z-5MgOZ+VdESPD7AH5CeneVojQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:04=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert nxp,lpc1850-scu.txt to yaml format.
>
> Additional changes:
> - keep child name *_cfg to align legancy very old platform dts file.
> - remove label in examples.
> - just keep one examples.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied, thanks Frank!

Yours,
Linus Walleij
