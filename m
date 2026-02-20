Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBF330B01
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771588685; cv=pass; b=JJsIK8sCup0XQfRpNG2yjkI1zWLnPZ7FCFlRC4Cg5EvpXeUEqyhZl/ajC3fV6xniZRs2QGa4tk38slM3m2GPOnb+6bU9SYWrVpDn2Bgf9jtM2FVBA0K/yKzfCDKXytiRGhuppxq0T8Tzv27HcNRcBIFJ4ipIG1UlVkIcWWZuDvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771588685; c=relaxed/simple;
	bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frbfJPYD7NWmIi7aiYgTSGY+X3S8lTx6GQvlik+au4Pxk+UTOCpoV5u3qNZ3DObKiBG785C49X6eA+2uqqwJiIOvgKbnXKGCG0hoGnnAs+Fz5VYc049LifewMI6kZM6mU5E3EkRioLNTGKloZHmQLmHEGS9w3aTfXf+mAgV5yy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fet2fPNc; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fet2fPNc"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59f791a6e67so2610009e87.0
        for <imx@lists.linux.dev>; Fri, 20 Feb 2026 03:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771588681; cv=none;
        d=google.com; s=arc-20240605;
        b=jh6XMChwd7qcaWRkFs6i2rWGCKHIrvTJ6OAsgmuuy4JY8YDhinB4YvcrLGgYqV4DtW
         aGdDk9DzXcWmIPV9v02hlmjS9SmBD8hLBvBqIsxVNavoQDjRl3m2fwfMsfoVxyHba3PL
         6qihGSOV7mzd4tXoe978+0RR0jEM/0z08DChi0xf8lCM4LIQd8SYP3RAtP1ojrhzOMPb
         f1SBjfpaNaW6E/2yfjcLGuqo75cbksnuCeMSWYbmCaz5qs2slIa2UrMoojWG2sV6zAzo
         S6zl9RDTVnBFU4MhUehers3S77pOY/+sh/XzRdKU+bZJcENCeW/FeyZPl9kEWfZM6QYd
         uSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        fh=XzkgHp5sk/qHx5gSiXPa1FgNLAmodq0umTClNSmgODs=;
        b=bd0JJH1U6jMYg5pGCSmNja356LQ1IwfG8lBwIxkthoLchLv7Ou0rxxiGszGsL163/O
         ynevX3c19mNc2vCMEugoh+yboiQ2a3XpXEeF0kUWHOnqTtXFVRp8Fs5Kp8PNcjWjC0EC
         rPkS0nyiXlileYIGzWlCo6FS2zopnSo3Ajb24IyL6NJCOHAIIbCodegZcoJPtREN0hW6
         f+p5ooJl7+xJvgI+xcisYH5BFqznIHdnwLPRIpEjFTAvw1/3LSktGjL0MJHMxp/A66aG
         K9itFyP9bPqN5okNh1tMwdfS3N44gBzmpo77gx5w//3BKMGxGJeOl48kcLYIKHxo2Z0n
         3IOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771588681; x=1772193481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        b=Fet2fPNcZURf5alGM4jqQP1SZzPHWm6ycCN/Hf5XFZox7M9n+1+51nBvHwa8wsZKUC
         8ZmW/pQ3T1XVmeDOczDMqIFu8/hojid06w9kXd4J9V/48tb9xUAbSAdJQY4iRNW3l4jM
         NMwLL6NlM40AMWHxjCToyOXXfW6L32OW5UeRzKnCdWNTGA+93YsPNsVk76OixEjTVrH5
         y1ktRuq7zsAR3iSMNKIRIFPY9lDaSko54y4pM0/lkK2dmBwm8In33sF0uiiXkoXydLDL
         WocOtTvQjyRtrA0PYQAOhoj/hCZ4G/0gqQPoM2/jlWiergb6aJEaWBt5e1u8MRCZA/Rx
         36MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771588681; x=1772193481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4mldCpjawAhR8uySP4hZ8wH3xA8XRX1Pyv4rGdxrbU=;
        b=ZJyVhVG5XGZepLC/IAojptdTu3Fg36oMu1j6UCMbSeipA7NdL/ZQJ1QX8GEjA1Jl3T
         q/7/VPwjIreI1MJmxtwKk2in90aZFcOTRmaN5mVy9ZTlqQGr7UDQ2rv5sl2sGp47S263
         ZHPZo+EoiQyg769EMMXe78ssuVQ7EWavDtIZo4fhZIjs6HVmL82QsBWM3gz76AcxEjMq
         3pAHGxrB1BcL9Whou/2ilDmmE7xVmNvSO0dfAzeNs8mcxj1NwYzEwimtywomGyW/1O4x
         J1zIkbXCvNbxZZ5CBITTz/sxXKAb28JsNwifIB3Ulr/6CLKeho8lDhh+LDkNFEdPHNQQ
         qctQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuvHV8A+yceu/nOWc48m2MvEqkbm59dVFLSFZYRds+BizjmnFRtRVvM2msf1XzqAzl/8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSvJXV77oo4PAFiw4npqN+NMPzi+6qniulC3S1FtT5mCOiE6lC
	LV4UWR/Kn176TFDIG+sfmxknikMjg1DJPCX5Kla8LE2fsaLOLhK61TUnij0BkJHexaC/QkPPC0b
	wMU8wgQC4EBSPLajBqzzk9PC3ZCDGnnY=
X-Gm-Gg: AZuq6aL47D/a2y00h+A8YPr/0KO81HOB3C+MuFnuN16TLRnCrCYFkC2Vt1HE3Laq4gX
	BVYKJjcHo+3kG3lo71vYYJsa352SHHPMQGCbFozNrEvRgIL1ABTcV8qt2BB4AVzE2F3Mf+dabCF
	aN7SEENgA5Sr8LobgQDg8HPEo4ddCtGJqF8NF0KVgaE+rD3krzvSeuxVwxO6NsRN9GV8/+amW4O
	5KwfRjoOszwQIBUqrd5nQ7KSO7Uj5YWdgmqnzGp5iOpTdSOt3gyVWj6RVgz6Sl/91QwPWnRrq8H
	0KkhfvIjeEcTRUzIcbxHDeTwPUFU88ZYa2ZqjjMTdqFDoUEmRa2E5Daonv+9y5Z7VNZQnAA=
X-Received: by 2002:a05:6512:36d9:b0:59f:8dca:693d with SMTP id
 2adb3069b0e04-59f8dca698dmr1155437e87.26.1771588681209; Fri, 20 Feb 2026
 03:58:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220103636.9697-1-frieder@fris.de> <20260220103636.9697-5-frieder@fris.de>
 <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
In-Reply-To: <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Feb 2026 08:57:50 -0300
X-Gm-Features: AaiRm50XZNrFKYb5ETk17Lmql-pIZCo4EU6DvZWKcKq6NVxcvVE0Q46aMC1Z02M
Message-ID: <CAOMZO5B7kYtXzKtguYe=2YEnSm6rwa0vTHJwn1p6pUqjgZ-b4g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines
 in DL devicetree
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 8:20=E2=80=AFAM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 2/20/26 12:36, Frieder Schrempf wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >
> > To make the code more readable, use the macros for the GPIO and IRQ
> > settings.
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Typically your Signed-off-by tag should come last so you need to swap S-o=
-b with R-b tags
>
> in the commit message above.

Is this suggestion valid?

Shouldn't the tags appear in chronological order?
