Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B08340A69
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295202; cv=none; b=lExL1nHkjBdWx4nS9h/+bvXdm59xfb4pj4Tw1bEEIY2TZFjgKvmSs0zWUIJbBIJS6p8ByMsJxA4i0F29DpGgqMRognBwvyFNKWr2mU0jvRZELgvJiBZ9zyR8+5iPczYi3sx/i2kjvcdVB+Yf275TfulMu69wE7+a69QzkiHeZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295202; c=relaxed/simple;
	bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYrvQVNRYcp9n8L1hwoJOuWQGgnjXwZ7tYEKNUBaRdIPWmeRChpUXpa37yRYrHVqBHJthE1VLcjLI92D0xER1ULnzd6wwtatv7pM8yjWb/YcgqEvICYM6hXJMUNlKi0XV5B4LhAvoab8oXq0A4kJFwgHIN8B+mFuv47RIc5SoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw5SbRA3; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw5SbRA3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-122008d3936so5209043c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295201; x=1768900001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=;
        b=Tw5SbRA3unFZQzXe3tVX7a6HzlKQhd/8YIjGrQgtYV2tZ+Jtlg/2ZlUs2qGEgC061+
         zK8KRODl553LIlR9DBWF2vTiaA/u21oBogIAsBWEGAii9eb6Vh7+ogXzXJ19IKxt0+A+
         eMlH2F/1HWNixoGIMenyhUQuNgI896lx5UM8gm/G7pAzbH+ffEyP/kxL4wQYPuTDWtDz
         5MOWKUxnOgh0Gm0NbfT54hUEYjdzr3SKKroSfwLQYVKFEF8v2DM2bUxi5Fb7n3Ul04AD
         ppRlEiJNwJt9ss6bllgMNFk94QcyiGJEcsWeqnhmGikZ3JOUjgqQVKTKjHTWMk0vdSoP
         pycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295201; x=1768900001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=;
        b=RHU5YWNQVE3b0BA80ghL1CXSqGq/hY5I+PVCxA8fJ1WA2WYFAKcKkAjv8a9u0/X7hI
         UdX7Eicdy047ZsILla8o6yZybYK1H9hLTszZ5FxdFu+yQh7co2Hg59KZ+C9ME3YLYu2z
         nhdWJnVF+aYbGHsnMZ2wwX8bZqZthLMP9MEjj4ThH+JeL+g3VycvkesUqHTaKGC7Srzc
         8mqZ9TrleZR4Svl8LrTZXkp9oqKa9kb6w7k8pchxSIZRyaEeZsQ+cp7l6lh9csMxRMUl
         lF51Q9Qcc1YqgVYpZBShBplaRcPc+IRmHuD2h3/leGsAEVdoWJLwZuHXHCnB4BC8hOY9
         OtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVweWrvpH3CyWGTK81BFFvcXJViPQkjjsKdruYOmR3cV1F8lZh2rjpnUlZWA3A19yvPhbs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1i/UusXWv9+CbbMj3FtLO8Oa8SrGoMkLBLY3GCmd0aogP83q
	Ui4zszZLNhe6KVYw9mv+Cj9+8Z05dQQQlFJIFgmvtjz3bwTVk5IsiIMkIPf6HbXlQQ71LBZESCr
	EcIqDQH1pZMwLf0PUEnGbeVZMBsZ19P4=
X-Gm-Gg: AY/fxX4SZbAi2D+U1a+zQlQzYy517+jCPCcKv6USjQLfm9kXIp9hW6BNIfCQkVmpLlp
	ACnIhAbEdh+A6AOkpf9wHNGrWXINgQf3fXd534HoFROkRVf8xCl6ICC7gT6aniAa5UaRmMe+Cjh
	SZZ3P2gtUJBwIDOflDpGiYp+zKyIJeWND6FxTIB5Sf48vrUMZJaGhUPyYAP6vOrlmAlAzxgb4pY
	iY4E0nQl/H5F78nbkzyijXzRtATBqYQOfPMy+CDLVvJuAa3q2EseuOlZU/OpdngZ6n1cx7ZIgZu
	HLMfxzkGMNMK39QFEj3DmAzqJe9yR56JODyOLvJmtc55/aAAj4yXPAJ+gieyfjdb+otIpX2TOLb
	aNUi9Ub11pg==
X-Google-Smtp-Source: AGHT+IGzTPihgLRH2WBSYhy3b/sb1A6ZhRnma1ayeDv2Wq7sn2KRkoB8Yp4DAlFqBtKyiGczbVqArPyWwnXGFSHFKGE=
X-Received: by 2002:a05:7022:2388:b0:11b:b622:cad9 with SMTP id
 a92af1059eb24-121f8b2f64dmr21239052c88.21.1768295200627; Tue, 13 Jan 2026
 01:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-8-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-8-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:09:10 +0200
X-Gm-Features: AZwV_QhyiXCNvj2q962FdbsX8qNV8prAt-LhktWDFPDefQTkJuEkybRoDjuKNBw
Message-ID: <CAEnQRZBvuM608DoKSGVbjh_zV9GE_8BOr6Bv+otKkV=uCRoFmw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: imx952-evk: Enable TPM[3,6]
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable TPM[3,6] for PWM.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
