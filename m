Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE88460
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238349; cv=none; b=H3YdP344tobivh5ExBb4CSnOXkNtjH3Vz4cPEe1OBChHMSMlkwkS7PP5l1AO514r1fLpLxXZEdfKt/Zwv4Mi/0ZntOZGsnjM2YusADeDrUj7qyDSn4C0Q2bLTuh0BNTTy7cdSxLj8Ar1FqZnQ8OMNSszKaXav3aM/47r/cPoLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238349; c=relaxed/simple;
	bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvpVTd5EaqgfPm9Joe9BD2smzgDesu27dHYL9wsiSr+faAQdNhd2W7Lju6Bp6aYfTM8dunodA36LbtP1JMJGCCAr2P0imr3uHz+xEWFzBP6+gIdmfvZAUZtxaJE5A2DBH2qq1ikzaP5xVnmOLIAC9Md5oTwpPsxjdzD0Yl64LPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p6VbStVw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6VbStVw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3881857e87.0
        for <imx@lists.linux.dev>; Wed, 18 Jun 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238346; x=1750843146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=p6VbStVwHqSWfRXfn86R3XHiKhJAY6tTkKmkKRfHDa+YFIud2TGebilyhTjXDKdfVX
         1Rle/ZSTKozVzt3pB+c/Nz7IH4n+8E3RxshpXLQLYmU8oGVMIkSjuEM2mLJfXwgsrhji
         oCqDGAS54LWnQ2fWsQtLWIeL3jKs3/QY1PHhY42dDff/lMUur+N1N+iMf0h6hSTMrB2B
         nhCcJZMnRIJN1iiAt4ZgD2eT3P7JJCVXemXv0S7GStCdnP5Xd32RHmnUZtBFOeKMehXf
         H8TcLKXyk6CrsytzgHx7WMNyg4jf9yi3FKs4UOSOUc8d5Gv7c1wp22V443cYdVC1hjQf
         xgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238346; x=1750843146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=chg4e/5wyAadBHr1W9gHaEOB7XhlVHlRxtIXBE/Jpr5VaRs6iTLcBoz1CzqInSP8Md
         tWwcoUp0lvFZMTV8ykLl7Hwo/wN6qkLtu4Au0y900USfFtP9+XsLSn7toZshGW8Hf2eg
         RWosB5nRXv9O36KaR04UDp2nfO8xiqV5npC5zHPEXaUC6QgBvoKZrfytsKnrGJtRSkk/
         Lk0iMS7kxLhX9B2PCleK7tK9HAzjYxatTqD937OwMpFofPB32askX5JxM4nOlI0Zv8sf
         cl/Xox4kG59Z5iYIpOFiHGKj7QXglwx6wKunUvS7C0LSsH4OUu1SfsGwzIfd/yve4Ti8
         2NBg==
X-Forwarded-Encrypted: i=1; AJvYcCUZuMeJsNFZJtZq4lvlHIfpQE9CSpAnIiPLVgzZZCU7dH5qq3pGyC7tQbjW1CJ50YUlyLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQdsnRFMcn7UbR1txm2xEhwR+m9jktq6vzTWhAecfbPCZ5QoyC
	Lkf/7YG7LonyJtSBK846v5CkOUQFYmhMuSXSJuSQozkt1KqK4dVEkQV7sWiflzi9zQtRIcPlgg1
	jHLPk7FCr+D+dgZ/7/+5BblP6NnEUeFFRdt99pcT24w==
X-Gm-Gg: ASbGncvJCq2n/PfxtBeLtNqKhUqdtBuWgI2/IqnKQkCYcIG8h7o8z4OxzRlWzozU8S0
	+eQ4ukGabWC/IevF0fdK8foBGkUv0Qi63htL4UoDGzjYvEdTuLGiO7C8744i1ysnE+ujZlRgLX0
	kpbZErWZijgBAuMZLOhndW9IGTEfgk+MiHQ0IwoQ19TGU=
X-Google-Smtp-Source: AGHT+IGDviP5o5BpdYRHMCQZJ0KKYxkJwy63WpJVsRhdouoscbb+olcEs5D4kGqoukI8Mi1y4ymDThNKrTMCoqXbPKI=
X-Received: by 2002:a05:6512:2212:b0:553:2c93:613d with SMTP id
 2adb3069b0e04-553b6e713b0mr4277828e87.5.1750238345840; Wed, 18 Jun 2025
 02:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:18:54 +0200
X-Gm-Features: AX0GCFsZz3aglhMm4E6BI1RVEFU98orqUWOtObnRoTsKi2nEtjPjvdxkzVSQEu0
Message-ID: <CACRpkdb9=PxzA8FGR2=Ox+ndnAoh7LBB+QVte4kU246eucvt5Q@mail.gmail.com>
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

Can I have a DT binding maintainer ACK on this patch?

Yours,
Linus Walleij
