Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8464F1946A8
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927345; cv=none; b=cBAgUpPkn/PX2c6Qp6Acditd4vSmXla3/g/vUgw+OQWGHU18q+SMf8kpxW2XA8nANB8oL0HY8bZEck8BQDYxrvFnnO1ApDd3baJ4AVyIhzxAaIWmMT9STJ0EXQaxzJ427a0o0xqdexxITRhuSnAbV0XyDlUsYbfDvDiD9clBG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927345; c=relaxed/simple;
	bh=ZcFDjxCikiIDehFzhPFoKi4SBUA/t82ryu7kG31flDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma83/mYei6n0qTIQlV6SH27KzyT1JpjBeUYaFrx3Ifb7clkfY+nEUeTIGh2o6Xu3bTJCQ2UTrNZh/kRWVrHDLIN7PZXVWBzW/xrj3FXWwyf1p7vnQHJUTknxXpxzvuc+23y1vS9fKHU+9IzyH4oApRCRoCcaGiOSynQNJGvUHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hb5Rnlwh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hb5Rnlwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731927341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnKB6OxF/nzSNsYCRUDY/ZZFnQ2D348/yl+VsYaNxvk=;
	b=hb5RnlwhJZd9uYV7dmkpNuh5s7ne3bbgbiK45l/c8SiESei5uuOP+Q+4zYt4mJ/zkN/1Nl
	YoFv/8UgEnIlOiSBL+Ha3xdwvuKckOgE4XOjyCeuB+osdwuhYBCnFc2gJ9OBmXElLKgS6L
	DztIC0i/X9akmep/Wdwe2o9FYlqHao0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-O41eqVe_PPCuQnIBgqaPBg-1; Mon, 18 Nov 2024 05:55:40 -0500
X-MC-Unique: O41eqVe_PPCuQnIBgqaPBg-1
X-Mimecast-MFC-AGG-ID: O41eqVe_PPCuQnIBgqaPBg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1e429a8fso136385066b.0
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 02:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731927339; x=1732532139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnKB6OxF/nzSNsYCRUDY/ZZFnQ2D348/yl+VsYaNxvk=;
        b=RUJuU0BC/Bx5djtepgmgx1UWiUVpozitmYx73RCqSHT5Tm/+gtDiLKiSASSHchhx6e
         iBJllhk18VnmOYZipT5UzvqejEIreNL61//12KaKABFv16BfMaMB6+lzotgC9ZF5sgQ/
         TlQD7HHCZDt+iftJ0oz5oF9d4Zv4B7ku/rn3h1xAA2ULBYrbfvJB/OcoUPFkm9EYMpeL
         TD5Vyu1aHxXAj/O1pNYqN+eYa1tiD2DGFJ7c/Y4FsZNFotrx4rLO84kxt1k6wsNY+EHK
         Q2kNHJfQgHBkOXM21URAcmrgynZEBQJ6kTlA6iMPXox018/MNhL7y+sR22/74dxVM8pY
         AW0A==
X-Forwarded-Encrypted: i=1; AJvYcCWTPxNYzEbnuEgRNvsodxjcs3UecxPcC6ZMMjvd4wuYxU892lcOUgBwUgn/0dWgdkD8QVM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCoWdxSFw219W1+hHetrgkqB2Ni5esO8EC+kX3p7PSkZVHpOq6
	yTsCl366f9GMA+2J6ejX9OClS/RLNmKlAf1PDAAXAiBAglOBG/tWW7Ghg3A6B1sriJYHQI/GGXl
	2JXqsv0YoNDu6hQtMde88SluVSCHj9dCiqlS03ITlmQyf19mi6A==
X-Received: by 2002:a17:907:d24:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-aa483420c9dmr1098522266b.24.1731927339048;
        Mon, 18 Nov 2024 02:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2vTdiBnn4PitIg3NGPzUBSRlMyCFj1MIDShUo/ICNJU5eRSVBn7pak/o015A12IJGuEwz+g==
X-Received: by 2002:a17:907:d24:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-aa483420c9dmr1098518766b.24.1731927338635;
        Mon, 18 Nov 2024 02:55:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd721sm536956766b.107.2024.11.18.02.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 02:55:38 -0800 (PST)
Message-ID: <322acf33-4569-4e57-a4b5-af60cb0091b7@redhat.com>
Date: Mon, 18 Nov 2024 11:55:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] power: supply: max17042: make interrupt shared
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
 <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6RFUs9i3yiQ3f3L0VFWnzk-iHLmdHmkOqLf-Tt6fvUM_1731927339
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dzmitry,

On 18-Nov-24 11:09 AM, Dzmitry Sankouski wrote:
> Fuelgauge blocks often are incorporated in bigger chip,
> which may use only 1 line for interrupts. Make interrupt
> shared.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/power/supply/max17042_battery.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
> index 496c3e1f2ee6..99bf6915aa23 100644
> --- a/drivers/power/supply/max17042_battery.c
> +++ b/drivers/power/supply/max17042_battery.c
> @@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
>  	}
>  
>  	if (client->irq) {
> -		unsigned int flags = IRQF_ONESHOT;
> -
> -		/*
> -		 * On ACPI systems the IRQ may be handled by ACPI-event code,
> -		 * so we need to share (if the ACPI code is willing to share).
> -		 */
> -		if (acpi_id)
> -			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
> +		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
>  
>  		ret = devm_request_threaded_irq(&client->dev, client->irq,
>  						NULL,
> 

