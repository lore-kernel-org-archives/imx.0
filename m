Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F53043D5
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761012; cv=pass; b=WuhD4+0Z2/FxO3/D2P6yPT5bgv/NKwsdplGc0tvoloi12Aph8sHgrOmG0tvtbJgnOcQPzTWvGUta5trsuPkwjgVdVRmNffv3GyEeaiutU9LnCpgvXSNLaM1GjJTVpIfrfbXvYC0yrpFbAQ/36LCPe71lrD4GNcvL0CV7a4FPgH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761012; c=relaxed/simple;
	bh=t2JsmQ7gHl2ZvmEVuEnjm9WXT9Hm/NM7NXsCAyMrWmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gcp73xebfimbcOxKuySOW4G+XcFyxDTKDHOYAmXSE05WMh5mRXhHg279lZtN/IaPBA3YCgsImhNO9bTlEPNdmCPw1rPR8bLxXvptgsrrrcSTIIhsgumPOEFTVzpgsGxcVEt4s6izOlWur9/7hUeHKonPru+TsWG1UPO67Rb5GQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tq3siMJ7; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tq3siMJ7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b886fc047d5so1109418166b.3
        for <imx@lists.linux.dev>; Tue, 10 Feb 2026 14:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770761009; cv=none;
        d=google.com; s=arc-20240605;
        b=j3/JOkyRFi9Lus0WFc3umuYm6rK4Zh24ndB6dkKXV+M5D66oF3wpB7wb0l/UDEUk7n
         b3NaNlSnagOYpbp4EQr0ti53+6dk3lW6NR+maGMfnCLlpUBBbsLIrc/J0qkZAjXuI5is
         2gegWQBkDP53+EfikY75MhOjWLPQmgdHlyl0MTOunxuFB5/bSA3y09R1iSde60tn1TBu
         xPWRuoyz2HrcQWnabvOfS4XvHzvdqibzmccZMEuB+X6/XDOOU5D+ze7w5rz5rEAcjnRI
         1X48nvKfF62zd9oQwuHlDZnxG4QchcuQOmWk0pbLeg3q+DRGZ8TZz2+IzdJIBYC66ky6
         Ff0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        fh=WeFwF+jEcz6LoSzihnJGrY95zj+5oSOEjL+a7f1c8Z4=;
        b=a/4t1caNbYWhFGTDKYlkkleSunzLYk/765sUesBNBMnjvmVfuEMUqOZjoFhCnNA040
         ItptGWIWtYngiHXtMd9cVt5kNQQP3dgYhOL0lJ7D6QMPP3q9tRSGY3rScAkEK/Vh3nGK
         f1meZ9S4zqVrbfDSrljKDzFEvJ9K1It5O/ntOVhz/0KuMuaVrCjT45xg7q57Zg2o8fPD
         ct0KFtt7RAphc4xc5qR/tHmueLh8Cy6SEQCCekD/zZQVs27Im9P9djN3x1dj9xuucJuK
         cudN/DpQleAEbBTd9MVLKTBN1QtKWlKZ0java3UN2HcWvpOwu1ADeyin75TN2eeh1AG3
         aZEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770761009; x=1771365809; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=Tq3siMJ7wTtHkfNRlP7K/IP73SAhEPQWb1phY99l/ac/4kviap0CLzbTe2gLUrIMxl
         z1nGaVHeN7KRT6882THTlBkbZB5xtJn3ZRMi8AdEJE9+J/h+fVBU44Egr81vUi8l+Xtn
         Ytz7HJZ1Pn+SA8ShHjv9h0hJMSoARBF2MiAZj3fx3+iTMeVGR/fX1CsFoeykzpvkV/z/
         B+Kum2UIMDKfU1Uq9u2AuJASTPJ4LvyIpQhpm32tWsIKtyRrFOPh73lkb5opfIdSCkHF
         0lRa9aDr1GMz2d1GP67I7GSzXQOO0HZbQTqLh1gF7sIs2T434k4vg3Ii4ZRThFHSUjAu
         Stig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761009; x=1771365809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=nBpHcopaInjo7DjeT7owm7SRAzwLwrbJSjBUYb7fBxdcyHcUwQYxjb1Q1l8yNb7jW0
         7oykQDyrmtrUaGP3Pu5R3jllVui6QJTn+ugf4xq+ylCEr9WEHeky+tceD2oLLrwJnFTN
         LHzYas/vzK9EKkyM+jrBLdLRwoHqaCcE+SPkK8rBDlM3G3hBpmmsXWm70bAcNbRjfSo3
         UZ0sQFOl4csfHHFXW+BdnT9GV8is5C240FLFHNz5WUfdfl2JrYqJkEFGnUkr+Fa/uhDj
         0yOe4I81bz3TcMPkMe7OnJjrBSvchg8oBaXY5bCUwqO0V726px9cBOKL3DGmRWCBh65z
         SQOw==
X-Forwarded-Encrypted: i=1; AJvYcCWPBxgLbqee0l88LUWsG7prpNXPDlTU4Y6K2wzEIfkGk17n4eKN/OgIwmweCKxMY40J7QU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPg0gHWrXPliZ3EWWgC1kmtf61//78ca/af+lLuMQoxFJyGgIX
	CRdhiWHbnv+DUi06cRnEZzsHPpHuE4aBbDF3HY60k8DVwn1ApQBIvI/OVM5mMFog+thkczi9t4x
	CJiqeL4Wvz9E4hfeNrjlW8nAKyIw1VMg+bXztviOsPw==
X-Gm-Gg: AZuq6aJ3KFc8WptxKI2iDSB3YzfdtLRxq4zcT4WcHN3tDo34GsbjcCI9+ZuoAIQQr7F
	RRxW0is4lVEsfgwVeQZovIQbm3x3QOh6dl5swnL9rmKOTjJd26tDqMCiGU9U6TuVRWwyzoP3eha
	D0qOL5EHv2PeJaZ9g8LzuZxZ7eTK52oOUrrx9BKve9diQ/H/682KjG4yl16QB4m0bmqiySiWlvl
	/r6lU7GNu1PzU1uAvBIqRqWe5KEfUSZJHlTK4uI7P3+ir+WmcyOcbh019hsFvQhE2uheMRRsVOQ
	kCU1b78xUBHK05F77kjK+eY2PGNNiEnjOfStk9eaHg==
X-Received: by 2002:a17:907:9618:b0:b8d:be68:bc21 with SMTP id
 a640c23a62f3a-b8f6eec8fe7mr6747966b.21.1770761008993; Tue, 10 Feb 2026
 14:03:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:03:17 -0700
X-Gm-Features: AZwV_Qgdm6kPXS9NZM-j5COa-F6f74PqWhNBvMsMK65d02PCcMWV4eo058PVXss
Message-ID: <CANLsYky0HEkzL86XZ5K1NwJ3Gh9DcQKwu=WwiozMmus8UJQDPQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Feb 2026 at 04:29, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
>
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
>
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
>
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
>
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>
>                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>                 if (err)
> -                       return 0;
> +                       break;
>

I will pick this up for the next cycle.

Thanks,
Mathieu

>                 /*
>                  * Ignore the first memory region which will be used vdev buffer.
>
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
