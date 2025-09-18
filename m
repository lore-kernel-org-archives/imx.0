Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5DE2F60D1
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208573; cv=none; b=Hbl9vH5QQoVvse7242zR6GQvxQEfq85jPnAD0M8KGAQlVNdhLuSqDyO66ypFwjuKuShkT7Hl+DjSdbsTB+r0Q7kPEQQFpvVK7oTBz0dTL/HZp9eWMgU2X7NhWFlIvSWtASNRtO2msZmytvpgcj80kC6kmEJYmlohB/u/Zd3Z+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208573; c=relaxed/simple;
	bh=XpqlDA/hyMutqOXOtcHoeGa/ryYYMOPnkl081l9Xc5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps7OWBRf/wO0L2NhObdB6oWGqJRAXp4PJQgD1x1Ih322AC+CJo+Yl99H16dXFcF4BM3N97UKgnYkTFvQVi57g3fPOSx3GJwdCZYEnm7DRpTt+/DofwqkfvoScuz+alTtcniljJr3CgS1/xvzQ6Wx/U/hgd2Qdry7m4Dl9SUL5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbpakhjy; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbpakhjy"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d603acc23so8346007b3.1
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208570; x=1758813370; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=pbpakhjyg7ggr87Rmx9UlyuESLNakgrlR0IMElCyOJCVR/VqvOdUuWnHmVANxq2HDk
         KUgnhq5z85VVQfFC0UHg3+UB9CNeDxEZ6Z0FO2wA8ZvIDmNcuGMb8lP588TuK/ud23lN
         vvCvkh67iK/RajTb8am8VVHNGGxvbhBkkYyt86T1QTZmKQzZetgbY8ntgc4K5KI6Cu75
         o4cKQozDdHniMrH8iMe17qD8rAqSVL8Ss5g/+q4zzMHP9oeRpQfi8UnZY76ne8t2HtxB
         85hiU0H3MoK6mrtoZ6dlVKHwzyyT7jnB4/DFhnHGtBzurFycNo/gI+Nwp6+Mmm5lvT8N
         XWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208570; x=1758813370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=mXdIQJO1s3eMTt0kNPKtpkGfDaF4WGxTxlKF4NZ4pcd63qw+J0UQS3kEt5+ym4DKXC
         L4E9qBiXIvIXbk8qlJhZZdgb1YsuIIDudZlt8bfBKXhknYypNXfDWYYxRyNHqHbuMe+w
         LjT/+91ARufuYEYko0114tuZKI43lJ8DOWfXoYBY7TXA0IIQTQYouoxILTfKeK3CCCuf
         paUwy0YApwNyiCVVIVMIPy9OqaiQN4si3VXJ9h8i3s/UtMhFDobMYnf1s0kCU9mz7vBI
         bkKu3UBCso9MIxZkU05+8tpLUhfL9qAE9L/2HFIhquBofAq3itajqMhZKpbksqnNs8M+
         YXpg==
X-Forwarded-Encrypted: i=1; AJvYcCW68pPf7wDLZg8YDXGu5pqYqmHNJfQ/AOFOtlqcMh4tpBJ/Dv9TspT1hpt0pjoRAff6n5s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9f9ioZlVxdXgmV4Cg0MCKYTmKnUgKBbtSvRJVF/LgRyrbISr2
	t6W1T2fvhvQ4A453Qap009AWDdrJ0VtTMQY4HcYuNhnGi07IgS2fmhPtL/Ptkd8+CgxM4RW4Yss
	jCKe1zkYpsC2vwQvHIxXlBLuQw1W3dydn/UHKP50WdA==
X-Gm-Gg: ASbGncuSgiKs/g5MkimtrKjqTlq0nlmS1bXU0xQej5q4VNB13SC4mNAE9guvc/fml9a
	NobJR1DAgQvuXcAWkcIhQBEHRGjXXu2M96LLwo85rN/buWCEEAOP6NPnpyKi9WC8f1iDuZcoOfx
	ZvxdwrZDMoXw0xTZUh2qw6qYjtEgtyP+MF+GSzYKHOFQlBiq2kgQu7Nh3x2KMZOa43FEsKC+dz3
	qjxtPLM1pBmddOxYnBnYVE=
X-Google-Smtp-Source: AGHT+IGhhJ7Bv3R+nZnqBzlYOnhgsyWlmTzS9C8s6bR8WkgRrUao/WcQHEslpUiS5E5xsVP21eeJhMPtVBvj4DhTSeo=
X-Received: by 2002:a05:690c:7108:b0:720:d27:5d0 with SMTP id
 00721157ae682-7388e0ff14fmr49402547b3.0.1758208569760; Thu, 18 Sep 2025
 08:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:15:32 +0200
X-Gm-Features: AS18NWCz7mrWAc40Ox1MHdxef1Mp2CL_HkIidm9lOboNSf8e8s0UW_BDcKfNYeU
Message-ID: <CAPDyKFrMPz8X23WAoj_8A3-SsdpbZZ5Ss9MbLK0yy6FLRytTVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 DWC3 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure DWC3 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index bce6af82f54c24423c1e1fcc46913c8456b6f035..fde158d1f6e3d89d261ed3689a17d703878c7e37 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -248,6 +248,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>         }
>
>         device_set_wakeup_capable(dev, true);
> +
> +       if (device_is_compatible(dev, "fsl,imx95-dwc3"))
> +               device_set_out_band_wakeup(dev, true);
> +

Similar comment as for patch3, please set this from system suspend
callback instead.

>         pm_runtime_put(dev);
>
>         return 0;
>
> --
> 2.37.1
>

Kind regards
Uffe
