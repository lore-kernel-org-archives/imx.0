Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7940926D
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841806; cv=pass; b=Nz3SHX5wUispOZ6gtNJX7ezGP+QMKn+mLFrIAq+3UKUKGVKUmNBTFtwZ+xQRVspve11ZC7w+WIcdQKHjkhU8t16lxg/XXugDZxe7s+tsLFCPjdUvuZsPUuzJ1HNOZs313QCO498oZa76HNOmbKUcFvF9XmDHYkDxscBjyuXc31s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841806; c=relaxed/simple;
	bh=FuRqRgm5X93wHWiDq/IF4XTcQUwJdxUW4yS1g+7tsuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akhsD/AmpnZ7+UKDxF6Ke1QOqwtiyRDoC2BdQL9J1xdK1J3vfIE22vphi0b717UEjG98w/NmmfJjn+43Ne3IKiLkYCnVb1/CwaBYKYVYCOLqLTgbet67klP9lrJgzVKOoC5qpCO8noc6tqs8r/OcvKkA2XCVxevEZ+m4N7oVgX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8QdmcVc; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8QdmcVc"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b01146b205so2763385e87.2
        for <imx@lists.linux.dev>; Tue, 04 Aug 2026 04:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785841802; cv=none;
        d=google.com; s=arc-20260327;
        b=l/ffK2hGN8A8BaqaBsaOKU34DPM1biJ5xBLMiLvppWsbCCH1Ve7BWn3QPlDH/99stP
         R9MvxD2y4MUwBQyJpeoDv4Z5JnDHf2SYL2ojVY46ZccbHRGoiFClsuO1YF2n81w7Czke
         IDcfksd/j3t17U4eMvYkfUFplfe3p9ZBM7nmdnP3jM5Ne71WbjU6XFFc7gfXRiWr7Ub7
         0X0CsdsiqBHYjUV2JOqnsJaXZUpqzeDmI6DKMhoOM2Rrq7/EKsIp8vaaoEXur+73ZVtu
         qZi4T3+47FmS/iMsnDRCvwSLon8VhcnCMQvaIhmr8TKt5qBw8hWXwRIVdtsTuK5LXN5T
         dChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuRqRgm5X93wHWiDq/IF4XTcQUwJdxUW4yS1g+7tsuA=;
        fh=VeI2aaxwlTWWPp4uUCIjaQ+X/rSeic0yMCaGlnXnCbQ=;
        b=lxk36zYrwOx44zM7C6Mw6GQhZe/8uWMgazqBxzzetQGwSiKjbPDxj5QBVLqnEja18l
         HNfYgJ5opzPrU7wxuqK9n/pQSqmJsJ+3po4qSy4JW+TtMY13npJBEb90sp+9B442hP2a
         7wKbsfgqU329kgdDU37wuGrgO8sZZ1AfDQ2dujllGieou1ildlnqtbkLqvkDkbmiArul
         bhraRiuJVrGBvVGOHMqv7G1+VZiZh0ZnIMSiy0c55djtKD3gkqaZELT/IqG8Jy9WsNxF
         DAwDfXQlzfXdVKR/D2fMNzPbEy3BjNWe1p19FyETsBKQB50nqX0+68INkAaF2U7n9i8x
         28kA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785841802; x=1786446602; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuRqRgm5X93wHWiDq/IF4XTcQUwJdxUW4yS1g+7tsuA=;
        b=i8QdmcVcZIBsZZdVVicyGaMm3hm7AEaLLOmit1H07WZ8bOxqqvU8gnIeaCkjBAJaor
         PHv1zH25+XaufZnPLceAF97tn+QaTTCfKoosW05pRRbgzGxI3g9WMtWRR4xAN2J1gShj
         SUv2/tVOEjcsZDAR1652MHO1IemGXdzoreRg418w7hK6A/wfOHfkuha5FJq85WbW7Y6g
         n5AyKSTNqoeq/GzfIThqow3m/EYAbAnGE9xGJk44xyYow4WIhV+psBlwfBRJZQeZqLsC
         tdfEaGxyJS03dCD3RWuK/ODRefP1QryxHKn4+i3m0nuKjq8dIEmMh2gtUATGFVXK63hy
         k6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785841802; x=1786446602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuRqRgm5X93wHWiDq/IF4XTcQUwJdxUW4yS1g+7tsuA=;
        b=EM870A8x4RnfkH0K8UVaQ6VHFbugKEII9vKVZzf6gP197eU1z50r77v1NZcQ6zSkiz
         K/6G0oF7B5vQ5MJcS8I2E/lvfFZzEDuyMSTxQ68zYqsH+tPCuTNcwdeeHvhxpsfBZmBy
         8wyswpNlqxFBdfJyvqv444uUEAugsGxh/gzLCS4tZPyON8m3Fdw38IFbvWmUuwhpeI3T
         fsgnmFTy2BC4YA7ETYUPN8kvMGa4TpvqnxUIFtWPzhN1ArRGrH4EcFagPavQa6HN/BNp
         Lf3gue5obRmyjX3r/23ZM+hwUkpRRxw7AY1ZKS8rMY1AKWoMpMl0G68ox3lPqBJE0e1G
         Cl1g==
X-Forwarded-Encrypted: i=1; AHgh+RqzFDQQ8YEJrnaTQN8qxgnK3i9kPcZNFrfY8moZDg9Uo8+cTTdRJTXoSBoIMPWdlrofeEE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0iqAE1EAWdcWCc4doajwpKSfJRBxNltvix7K8kvKKL5YfX/8g
	99XDcYTxg8VCMD7Ahw+Da8ncIgw5IXP0jb1FSt8Iy2PiSf5hkt6n4nvB4zKybYE1OK7ac3vBDuH
	qkd3eBIYa7wPGKdFOHzfx6x8hkRM2JSTeUA==
X-Gm-Gg: AR+sD11W/a7sg8C4PMTWuYkaSae7z1w1Z4depyVrGMqw2VZQNDqXKzpBTB1/zNgDtfz
	+tAXN2VRpFgFs24cvmLSsdPFHjIDE6hYo9BlSbUl41biZej4MmNiXlrVaIvBwkEsLYIfuNN7+i6
	6oS8FHQ53N7IvmBoUVAEZrsXCaCKYal2zA4D+Gvunpz017QwMT6DeLQAkfKCeWtubqBB5lH5Xnx
	xKXcabNHiob/Rl/hSWCeOjru5S17wnci8XprFLYdQTC9kw4oKk9r+jLbmbCrmv70ZxRqOZsM/7I
	c0w9dzburR0OJfwec6xPpbm3RK4yF6/lZ86su32GmOYzv6+0T2uuIl1Q1eUm9s0EIDeHQsr5g3A
	5rD4jbUFx8lWCloH2AALZKBzxA/BQJdoUqA==
X-Received: by 2002:a05:6512:128d:b0:5ae:bd76:49a0 with SMTP id
 2adb3069b0e04-5b2e4f370f5mr3323649e87.24.1785841801997; Tue, 04 Aug 2026
 04:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729221416.499781-1-festevam@gmail.com> <5ee0c572d017ca3ee3503c4e1901b8ac5d4f5966.camel@rendec.net>
 <f124515c087a5e7259c2ecc90a0f6e47a7619f4c.camel@rendec.net>
In-Reply-To: <f124515c087a5e7259c2ecc90a0f6e47a7619f4c.camel@rendec.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Aug 2026 08:09:49 -0300
X-Gm-Features: AUfX_mzCnWjVOk1obxgqAkXdRv2vlnS43t2UHV1v--kWakoqUakcG1TRbdDR5XU
Message-ID: <CAOMZO5CFe6P3UvnhrhZqO=ALGHUaBbQyP2qFeP6qfkU_69Q6WQ@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to devm_pm_runtime_enable()
To: Radu Rendec <radu@rendec.net>
Cc: tglx@kernel.org, Frank.Li@nxp.com, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 3:54=E2=80=AFPM Radu Rendec <radu@rendec.net> wrote:

> I take that back. At a closer look, I think both issues identified by
> Sashiko are valid. While the second issue is marked as "pre-existing",
> the proposed patch introduces a new path where the issue can occur
> (leaking the irq domain).

Would the first version of the patch be acceptable?
