Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E64B1486
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849710; cv=pass; b=bpQuTTFkmN9rdj/gKuApo53/0SpQ+45VPhgqRu9LKLzKkYCbI61cyAQQVoVE5rpWOm1xcrVMwv7rHf+bdDOFou0duXZK64saUTJ1Cj8G1E4NRavjOHp26Hd6RJJauD8EZPYyQLXDRDRiAY5wEt/m9IROUuqcAJxqP0s3PrgPqao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849710; c=relaxed/simple;
	bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkX/X+ca3TML5rlYETn2Hbvfdn0a+MMDQkkJDWqDiYHl/RGph2QCHtcwHD9z7vegEx7P9WybTk6N+/pCZDE/zXiusqJm0mjN0hAKfpQXCR5E8KbUYNIPWrSzfw2zyVTu1MOgi3dg2pF+lyWdGv/+Slpc8SGj0rMt2O1zcAehS7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/509uNG; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/509uNG"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so6217565e87.3
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 03:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790849704; cv=none;
        d=google.com; s=arc-20260327;
        b=B4UbC57nzIE5bzbid1RDKa35HrtZDjKwG8tbYB4uEg9e5f6nVPDv8i5IWk9Fb2B057
         PEws84xxScT2iz8uAzUwRRbTFtJyClBWy1R84ukhF0geuHdSX+UQnPeSsqbrIJyRvl/L
         J5ggXw7udQcUHttG8mtejDMAXzN7sAvhuAyXHGNTdoYVVxgzWQggcM7pzu8nH5JDK0tD
         KjtYuzLCZIHj2uZ/Bq0YmKRQu9En7d9ZFO4tmTmRHv1Of8I6eqp8TUErW/iIfoTavYBN
         cy2CLhKsOLnjbi1d/p5gwvEBZbtMB/+4U2F5wCW3VttQHmWX2poFgtb0JTS8ppSrO9AR
         qbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        fh=QTn1b0/jgEkeS6Q8kPCJW7Za4QvC/lc5YE30PPeBD6E=;
        b=SgspyL+h3T+uTqFdgMpgIXoJbouonGd4/dmAu/jusE3XBtNJ5SUkN0iXUvhp+7ZFNJ
         Txci4j0nuxpqs4bg5Ime2ZvsEon7jj8R9deINhBn8jxR35PNSSZW9raYyrITfcQ+rpp2
         HSY6HPF19v3hbWEVNaUA14oApIgNDnCTzPeQ2W1QRKrcNUjR3tNpqYjsvakzsfTt78bD
         neLyANln0gvDgk750R4OzcfJAm2qw9Se4shzo8v7Fb5O+XbBh+ikZsGesqcIjYTFYtZ1
         RWWOnUeySX2xV+z0BZz7MPkiBXlhdALsWsNhu43O4WCa6QbndpO7ZXvTQtBrXkDFq/c1
         ao5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849704; x=1791454504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=D/509uNGaqceqGdIYduWj6jrxc1tyZHKc7sDAolDO8VWx7XVLv1JIgbQTJ/uSp+1Ly
         tV1iwtpYFswIuYqhuDEXzITxFDtHAqSq2nZgFaTqX1TKArgh6TrH1Mmz/Oj6/+H5hvXv
         OPEgFQVmuLFGhSkGYqnu94s564FJ4mSiCzjuGgJPk28IKdSGEJ449BXhlBCkbg7wbp4H
         L8MNDFSXdcdiwZMemIfy6og3H1hVjqE2JlqwdZt8D81Y9kZBqrukoVoI0cYVRMvBbrbi
         fEh77UMzUqNDLxR2K/wrchXUGkGSRLbaAbX0R62MHd2k4c0JSKsO8tqnAPs+ES49INvE
         7oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849704; x=1791454504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYWMzc7dzXRMIQ4WDnbpQus1ZRBA7rO8qi5HTtl8Bo4=;
        b=C/Tsce9gTSC774RQm4bHW8XywqnZwNxac1ugzum0jt8U2bYLTaWvKCFnu3iSj1HlJ9
         xYJEHXKlXxu9duJITiYduZH2BXAWrkrR+dE7F+rg0GuB5YiSrWrRabV3tFW+t0NprMUw
         OpcQxCDnuZ2kgLLvoNzToU4oXGrfS0v3o0+zQj06CV/n/ACJYvL1Z8MfxVw3sz1q53t4
         d0hrFyzs4/Ps0fV9FrJtBdFA/w+D0qP6TJI8LFcMkfRXDTnRvhQV/xNK8oUzvSWtomSC
         WujKk4fHUPG37pIC1H3axHVEXuZaZNhvt5i1auk5gv4NF+yMuHVAFITfLBE3yc05MnkY
         TYUw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ulYp1lQGanCZ0f/Q5BI+OvX2NnvoTiCczb+pd1vFuEyQeYwXP8tXlcmdTUD6PcAfbXU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLFk4GqvgwTB/5aLSKv4zIYLPbuSOjouC3zrxaI9xEctF+yVyeg
	d2h6SFH79cDsuOae0k+prHr2O4clQ5kwGHn/tsLp88GEE5T7QouvzmvkkdOOvMj+uAm6QeX0dPP
	Ze+0QBNyuJsZOSsWPj4mR5CYkgd3Rg7Y=
X-Gm-Gg: AYBFou2jjjVh4qk6+ZBF4dXR4GztIoLHe5Go9+8KWJSQXltNHLULvzxzkYvcadM2Vax
	ms/dUOo0nnyCizummfnBQ7BkTwBWPKxIVP4xTpXp9HAAry3Wtq9tFrjBVjgs8ozxSFXjyGkVO89
	ePnaaZ8YZJNpgZjFtokrVyK453rYjoc5xqO+f3jVbz48/D2gmgeG2CSRrBErSVSbVqgr7uB0u2i
	D6EicNtSK5auM8JM3ZBLMCsbkcqrvVGb7kON34I0BiOHB9CKtNhiE1totvaje3VjL/tcWNdPJ8b
	WwJOShTXSgPHTcrDpm4sEWchx7hezG3IfhJrqZ2sF8lnPg0F7r1NQvmRuP8I6N2G0qPYtbuDFXz
	h4KG35CHfTKXxjeb2ImAJYgSc6jKoI61D5qU/mDeeaC1j
X-Received: by 2002:a05:6512:6d2:b0:5bb:784e:3df4 with SMTP id
 2adb3069b0e04-5bb784e3ee0mr282162e87.46.1790849703308; Thu, 01 Oct 2026
 03:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 1 Oct 2026 07:14:49 -0300
X-Gm-Features: AclHuK-74KPyiquqCXZSrY27gWUyd7LOlkpNPte8XIS6tTUYVa6o1fJvZXPOZX8
Message-ID: <CAOMZO5Aibmm3d=9Ucro0Tqvyh_s3EozLM25axV3XxeLuG67PCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Primoz,

On Thu, Oct 1, 2026 at 5:10=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.com=
> wrote:
>
> Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

Shouldn't they have a Fixes tag, then?
