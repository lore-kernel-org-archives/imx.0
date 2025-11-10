Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C05226D17
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756326; cv=none; b=qq7SPs+bllBbubvmbh7G23jg+ZDC+S2wCT4id9aiOe7VhLKsL5B/1GCnsiI6coStQTFMT57Ktqm95kJ4XW0ITvcU29ciUc/T/sYtnrgI42NeuousMj8H4LtYctfLr03O5NAjajdxqL4DZ3agpTiCeyKN7p+6SylD+Rv+oh5gcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756326; c=relaxed/simple;
	bh=SiASzPOTqxzOQZqsSiwUyYUrWviV4w+oB4ux8KVNcBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9/toA3vaonswJTJdagtQgmqGRKSs8Dk2hki/n+H13njxfqmTq8vgPmQvq8DtxrUaeRo0wY6uNgOgQNGrTFtpglukhTnbuinarvrCXa5XBdSW0bdv16pkFzG2tImRXxj1AIvxJt3HjanP3SP1Y9FWDBtVEkUkz3W7Wbde3e5Nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U5UF1Yrt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5UF1Yrt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471191ac79dso27320095e9.3
        for <imx@lists.linux.dev>; Sun, 09 Nov 2025 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756323; x=1763361123; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fD41ZL4TlCiwqwxi6QcBrdLjUd39djAdPK6JdkJ0Gzo=;
        b=U5UF1YrtvjmjLu5xyaHroASsKfYZT3ymNY85cpYaiY1fl6sqBYoq9IIUhftCRmo7Te
         Ju1iEzgXAYqGa8xq6BbY8WnvXR2mBqxZWiX0ny37lieL6b9SfoeR19JC7uRImvrpqhgK
         TyzpFUAIAVg+aaX2evbo7E3LMsk2GeswLjfBybF1MSzmqLnQRvlCEcXIbylH4qtZ1dpm
         BFgHxUeSApnij2t+9k8RoPIGCo3EPiK/br17yEHBF2EyhlEg//dt9fKYUSJohdmAsxL8
         s5caR8fm4T51fNLwy9Wm1/vw4K0nyLGH9mxd7BzRmIviyx+NxGu2uT88lPTyuJ5RqV7B
         aMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756323; x=1763361123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD41ZL4TlCiwqwxi6QcBrdLjUd39djAdPK6JdkJ0Gzo=;
        b=RjcVv8z4jiBnTwEf83f0725xEzQn+10GguOYBbxf8ywYgfngLYGlq4WM0hzhnAFUTn
         4vlJVRR0DSPmz99sLnwpA1MTLKJQgxw6cu31obiWliRPTdA7KT5jwOmPd64LPLeqOWeQ
         n9IX9GCucPTx4eeINUpj8WQaRPdNG03j4W0tlQyxsCuccs+YL7u1js/H4UDIDipgDgco
         G7Qqu0S5CIhte+a9HP6rHAgPLdE50VmVARmfDXvxyd6/dn+QrIB6ov+iYct1GClX4d4J
         lGDOpK/m5S0EvmZLz0paSZfVuR8L6R9oKp8jIpH1mCQyYnbemKqQsHg5A6CuDn5pM358
         FjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyqAYpiAgOzX5ZZ5HgMCi3iE0VMm1UU8b6xhocwbfVq1wUn6bteMx1j0j6ixxJN90KlU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhIvgYx8cs8xqzdfcg6760w/ZMb7DiRrdZndPZj6pakSVUuG7N
	nQLyBBu9Lwz4MWPzypAen0OKbRHFU5X4n+hdGBx/0TzA6uomwd7SFE4LBZPqQeNsR0I=
X-Gm-Gg: ASbGnctZ06yFiotSiId1Y6yorkbQvuCbXnWA5Hzn+3eCIF1G/oS1Ge89PgZFE0yoRNx
	Rua8IVCwyQ5/J70fRnbhgmDiPcualeO8aVFNMql5z8P7OrvToiGrwfY5c4h54gJQRPIytAeVU6t
	inI1h3pxq8IuWe9Ca47yJj6HQ40NZFelxAQardRwE5BFknVhprX75qQLNg3WZ4mBlnVNaucUgFp
	WUSXbuMuiS0kGijW4ccPVIs6SissqJ1HeAWazpO3iLmzdapQxKmyYhOxdQf66yqahBEdyJbCw2h
	oAH2xLuyg5Hsh/M03fWnb3f8TzcSJR4FbdJhAahKQQbx+oyedFc+Jaifv8k70rmFSOef/fjCfs0
	+u6Q/MMepOLUDPesbQtD2XaYvcgnbP6kbsi+f1M6zMeCJV7Rhzx6ut2I6QSJlTB8VaY9Ef3E48I
	sNJfwiltxULtLkg17W
X-Google-Smtp-Source: AGHT+IH7itPdnN3+CMIJFyI8o/5N3sDOzt/9g2GEzbgtOpPZGmoToNN4ZHSLHno+aeXqtWyjmYzHGA==
X-Received: by 2002:a05:600c:5247:b0:477:7cac:508d with SMTP id 5b1f17b1804b1-4777cac524cmr11045475e9.16.1762756322721;
        Sun, 09 Nov 2025 22:32:02 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm23183356f8f.41.2025.11.09.22.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:32:02 -0800 (PST)
Message-ID: <85b973b1-ec1a-4508-a9f5-fbf6917eab85@linaro.org>
Date: Mon, 10 Nov 2025 08:32:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mtd: spi-nor: micron-st: rename the die_late_init
 functions
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-1-cde50c81db05@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251110-nor-v1-1-cde50c81db05@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/25 6:02 AM, Haibo Chen wrote:
> st_nor_two/four_die_late_init() also suit for micron chips, so
> rename to micron_st_nor_two/four_die_late_init().
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 70 ++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 187239ccd549510c6e9a6eacf4ae41158287e077..92eb14ca76c57f29ece1edb3fe652c56d1c2888f 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -127,6 +127,38 @@ static int micron_st_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  			micron_st_nor_octal_dtr_dis(nor);
>  }
>  
> +static int micron_st_nor_four_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 4;
> +
> +	/*
> +	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> +	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> +	 * consider the die erase too. We're forced to enter in the 4 byte
> +	 * address mode in order to benefit of the die erase.
> +	 */
> +	return spi_nor_set_4byte_addr_mode(nor, true);
> +}
> +
> +static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> +	params->n_dice = 2;
> +
> +	/*
> +	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> +	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> +	 * consider the die erase too. We're forced to enter in the 4 byte
> +	 * address mode in order to benefit of the die erase.
> +	 */
> +	return spi_nor_set_4byte_addr_mode(nor, true);
> +}

I see you also moved the methods a bit up, maybe to have all micron_st methods
in one place. Specify this in the commit message to spare reviewers of checking
bit-to-bit exact move.

With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +
>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>  {
>  	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> @@ -193,48 +225,16 @@ static const struct spi_nor_fixups mt25qu512a_fixups = {
>  	.post_bfpt = mt25qu512a_post_bfpt_fixup,
>  };
>  
> -static int st_nor_four_die_late_init(struct spi_nor *nor)
> -{
> -	struct spi_nor_flash_parameter *params = nor->params;
> -
> -	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> -	params->n_dice = 4;
> -
> -	/*
> -	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> -	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> -	 * consider the die erase too. We're forced to enter in the 4 byte
> -	 * address mode in order to benefit of the die erase.
> -	 */
> -	return spi_nor_set_4byte_addr_mode(nor, true);
> -}
> -
> -static int st_nor_two_die_late_init(struct spi_nor *nor)
> -{
> -	struct spi_nor_flash_parameter *params = nor->params;
> -
> -	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
> -	params->n_dice = 2;
> -
> -	/*
> -	 * Unfortunately the die erase opcode does not have a 4-byte opcode
> -	 * correspondent for these flashes. The SFDP 4BAIT table fails to
> -	 * consider the die erase too. We're forced to enter in the 4 byte
> -	 * address mode in order to benefit of the die erase.
> -	 */
> -	return spi_nor_set_4byte_addr_mode(nor, true);
> -}
> -
>  static const struct spi_nor_fixups n25q00_fixups = {
> -	.late_init = st_nor_four_die_late_init,
> +	.late_init = micron_st_nor_four_die_late_init,
>  };
>  
>  static const struct spi_nor_fixups mt25q01_fixups = {
> -	.late_init = st_nor_two_die_late_init,
> +	.late_init = micron_st_nor_two_die_late_init,
>  };
>  
>  static const struct spi_nor_fixups mt25q02_fixups = {
> -	.late_init = st_nor_four_die_late_init,
> +	.late_init = micron_st_nor_four_die_late_init,
>  };
>  
>  static const struct flash_info st_nor_parts[] = {
> 
