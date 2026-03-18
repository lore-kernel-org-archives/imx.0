Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092AF3F9F22
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850010; cv=pass; b=fRz87yimH3clcZXop2B3XO5FMQMJC83EOVjLE2OAGLnP7/feWQbOX15Deun3XjyXmZst07hbQj21swUZ263kN4vjgWsfZnAd48K45wBOb9hZ9iE8gg6OKjpAzjTUknJi0gskaXdidDUNrr7wlwcZB4ZU6tDKlXugKLuW4rDN9YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850010; c=relaxed/simple;
	bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWvMaTykIAA8HvwCgu21XVBpKFidM60GZcWWa9J9CLa0+25ravvPYFsZAfr64GGziajgAYge7N8Wm66fIrqSdhChq1G3jtsKdbPUZ3kiXk78qVMq9+Qdi0eRdAZ70k5wD0iMsNJhhZsRW2YilG5RXwN5y0avDfCp0p+pOAwPgko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAJDQ5Xg; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAJDQ5Xg"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1279eced0b9so69914c88.0
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 09:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773850004; cv=none;
        d=google.com; s=arc-20240605;
        b=cO2eFN+EUd6e7H8Tjh04G1NHJU4yh4Jlxi81oK43ZJrT/gSpIxIumPrgmHkpcDVpqU
         xCklpwB6EWNKsIXkolHtH4DkH4oB6aBCmPMWoek/bxUtZ+4PQE9XEnlW6boy0yKEL1Ux
         VJwK7oPZRO2bxiHxdy5uxzTV+RNwOS54nV69VZzy8vHn/G1LixAZzKJbPoWSiKzsg11x
         DDvTkBIF81vDCm5J38JiTr4UETEdFrDUpeo5b8ZXw/YpA/Coe17YcQGBuW1eUddsjB2j
         VMnyyYmaqgPqNyDpc6KIOiOOptxwcvWAjibqJ41YIkfzizVAzPEBlZxPhBf7URpEI+M0
         r5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        fh=akHVRwQBoGToc1MYhUw+QPzzcNi6cJmjjFumhSDuYCw=;
        b=hb8kSQKcUsLcvwNx8oRyEMOPpaLCG3/gMN9/CcBbct982i/Gk4t2kPamN7Zc3AYJni
         CvMXgY77z2jwTzSuRhKvozkuFQppUT2tE4o46s3EN+W9UNxZzBLNYERpTGDChdNW2tWl
         CPQOMfFJFE97eQShtmWrdc/i0YSdMtNy40X94X2zY8NvuqA3HM+tXbeTxx8r0vSsNPpA
         tcGuucyHLX/QvLhObKZ4dfVCat4eoSG9bJB9zjR3Diiyew38Kk/2pRwWGXO32NtPvsha
         liv1besBBLUf07ZD/1wLfts5l5RiFrdZglHCdOrO8JYjbPJ//IVAW4W5I2yOjer/vfgy
         8CLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773850004; x=1774454804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=JAJDQ5XgfxXXuhB18hLhOOrtD34gvKg+gi1C8vHdRNWtvOnjYqk65DxEgobZznsVH2
         /HlibMlRWC86lTkpr7aCQ2Nzp3ijfkfSeSu5fhHcHAP/En60Vs2sh7ToHrRQhgYuutlf
         4szsIJg4rnYaRrDLYW1Eoj4elxTjNfWoFT3cAfNa+m2S+AZ+3Qiml3tod2LS87J8UvzZ
         p4yv3mqvJ6Q4sZT1g1V6PHeWLFb3XmcC6sDW+5GKcXhe0iUpp+l/8QEi2JRbXuj469Zh
         rdCEuZC0644lg6/gtGhCBjLifc+nuTPgFYEMbfO5GoqB/3VG/A0MviZpow2RGUOxATcl
         A9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850004; x=1774454804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=kHTD5mS5i5V9CaJuSViU82/jjjJt+JL6UMuszG6bdpX0v67Sm3KwyIm4yCCFu0IEaZ
         5XsHzCypBfjIKTPHMQpDoLG80IwJCIZaVDQL0CuW3wxP+bucxljwoq1yOu66HzAhdJTQ
         rVSf1RYWjVMGWBah3ZX82HVyjI9jXQEusP+g5FXZJUfo1GGL1P+C3pIKFvmJj1H2XVFg
         TwJgyqBMchUU7iXs6hQHQXfEM3pmB+Hb1lWCIeHQTLY5QV+7AABy18XR4ykOBW7opdbO
         z+dawqn3klbrG+yYZoHeyQXq61heXv7vHyHdiT8S7GiJdUbvU2OnZDV450rfg0nm5tic
         yjLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXFf1Ey1m750UHxjUCfRnWc4omnuseRlWCfZIKEimRd4Q9rkdXUE3TZpHB78QQKYDvj0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzF9q8ifjVjIBURliXreB0E0ZP1EwZGxpzhJqXdt7oTrNGp+jl
	b3mxbOqIlDLPkVAIomhv6LO1P/pRZHNxSc81xMfmlbcJHA89mgMsMRaESoRY94CwVmqT1pK073r
	ZsfMv9kWfhqS1VsDBLL1w0pS+n8g+oQ8=
X-Gm-Gg: ATEYQzyc3z89JwOWQSgdtw1MnedN68hjHbatm3ZtIXkgdWPoM/5JezyDCcmpT5mdHcj
	JvUnDH3CGW5kveATvgv2p68VmyDx8aHF4n+rT+pKwZfkzLn9xGkRgXvkDCHFkuMZ2VynR7f0O/I
	4eIJ8yDaMzffRwqxpKE4p+/n439YeGLB/H15yz+7BPkxSRoJuHHRdphEHjeie0OCCjIr0qq2znb
	6LUAX++3g78jkYe6S8jeAM4q9OYcRSHGRTBEVGgVN8F6S8YqchyTF+Qfgl8nnFXU3D6iU2L8q7M
	M9VHBlPSVUF+iFkkoFKVROjiJnJhbLZQXKfSSsY6QTk3VKJ4oPpEG2xNLVzPIpFyTKQO1stNc2D
	PUZsgYbL9eIaxoua8GaILrg==
X-Received: by 2002:a05:7022:421:b0:128:cc34:3617 with SMTP id
 a92af1059eb24-129a714811bmr1918564c88.21.1773850003615; Wed, 18 Mar 2026
 09:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Mar 2026 18:09:31 +0200
X-Gm-Features: AaiRm5289taSx1eb7TjHchZuhRz0bSwV54-QwJD6-l7mMGU5Fnso3LBqXAa9jCw
Message-ID: <CAEnQRZB6L7asKXq4rjPr+a1ai-jonBF_bTsT=Sk3ZJuNtUPS9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:55=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng for your explanations!
