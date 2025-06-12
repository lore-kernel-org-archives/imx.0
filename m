Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889B22E3E3
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738522; cv=none; b=WF03wcOmtSh2JQFljDomd3+X3RPZJNUlCToXZkpuvAyjlZmBeRJ9HhzzyYvE8egbdirfY036W/62DpKtfJmYdD90NlnHIiDY4SKMIVM1MHYXW2Z6xxX7QjcuMWunSTOcGLj/IQ/hzzYdBpazJwzxs7LVtnTm3mfU2h476UhIMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738522; c=relaxed/simple;
	bh=EJUn+HxEphkXa3Tmo0WpUA6X64DPGMauzWeB2gIGvQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3RrZb+MN/CbAoh7F6JlUfm0rPu154n4frzTPXfCaG1QW2Pc+HFTuGbQkaNJMe5FagcQDP8FsiQt6CaWfG6OTIBETvX/kV4SVtESDY8izQk4UVDcwGO4ZA/cB33xjVjNEorzIJI2MgTA1lJUBAR5bjkphJvasp6nB03u1oEaH2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERoL72fA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERoL72fA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so888887f8f.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749738518; x=1750343318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7rIsWA2briWQ8Yb8DhTmywFqeEer3lbSfSQBbj2pps=;
        b=ERoL72fAdU9ZZHXLlawUx9KwOu/uaBtzLUSO3JKxwAyYJQ+RQHmiis7KHUlMoZPukv
         9jF+W1KFuex3uXiRO7IY6N01X78Js7JqX8ChfWNs24o8/tpyJ/OTMHdtbadz0Vahha57
         wZl76+RZOGpmF6xTj9l6Ik3rFhfKd+Il8Q/wT2mfGiF0MxJbZ8AvPFdHDQON4V+YNutv
         FMUtjSzmlq9Hl9eKpjIgb66Nf7X0LXvchGfpyJlAEh2SvTjbBzm2wjZK0ne/pX7ReBei
         fn1PYYA3CwH/FGPhpqtbXLvcySiOgXmEyA4DVk1uO0XtoCwzwFqe9UI0jfP0rEM9dpxO
         HjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738518; x=1750343318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7rIsWA2briWQ8Yb8DhTmywFqeEer3lbSfSQBbj2pps=;
        b=j9N309t2pdnUKJkMbpfx54ErWa4yQzubhFPEA3n/9AZs5JesM7zH5f1bhgOLGGQAmd
         htecuTGgQCrgrPPm+ZrdgHxwQk4TooQLFva0i9T3UR20HiGoaQpaz2Uc6PsAbjS5dW+o
         ZXJHvPxA7q6Ltryz0kZWFtTLffgNxWjSCgKRDIEa5fh4yPJVP7LA4TbNC/yioVb1PleQ
         7JiE1yzGNMhRuUyMDKFPQkUx/NzY0redv6ChVX3bozyXb4BTSfS6w93M6plsJhCFr4pJ
         BdQDSyAy5yEQoju6KhbnN77AXsIDXETN+bHTL7EbQtd8ewblPD/Pz0c7yUhBOi155U9o
         JXaA==
X-Forwarded-Encrypted: i=1; AJvYcCUoyKnbENfKKBTQwK74PlchybKS35CIz3HN6ElUPH5Wa6zLOG4yi7HavH2VRgfKFgpGx88=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBrcCuJvtNRM+47WOMFsmEVfV3OAhfbah1mwn/1B0v4XBnGa1U
	4IA5VTz1k8eMntF4pCWPxRN59I57sZX1OdbHx1vR9N/ynmJ/FWLXLYlaF7UcySaNGuU=
X-Gm-Gg: ASbGnctbm0bAqG4dgwR2y0BO+oEEq5qIuocjIxDOK8GMTCI4OeSvld53SoNcEY+3wZo
	1aVxAl7FEsxO92RsOPmMNC3oRthLQ620nkbkL1YWFuhMG4hhZaEyQ9W4RkJkGVvCzhlrtPr9Udn
	6ixqG82PgVrzVRKE6EVizX5VnezShH20v0kQ9XQMF0KKKBRncZ9OjTe1EchC4s2HtnEh1c781Cz
	KgV9AoQXhJTH0rti0Qu0CbmAQx3kTsHbDCOyarBRcm+JXaWEfjYrTKXydx+tbU5zwR/rrSRjZVf
	e0fkMt4ljzfz7HJ3K4oqc5pJCZvo+FR+DBeoZxHrtLJhuSiuuCw11oJqHZAAXZlW3TE=
X-Google-Smtp-Source: AGHT+IGSIQRcM7fVzWirS8YoPF0tFI1UZjJkmBNxvk3+G8I7l0PWiFBYrTUOa1vhtpeoVhEQXQLGMA==
X-Received: by 2002:a05:6000:3106:b0:3a4:d975:7d6f with SMTP id ffacd0b85a97d-3a56076b241mr3276014f8f.39.1749738518473;
        Thu, 12 Jun 2025 07:28:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3cdb4sm2152087f8f.54.2025.06.12.07.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:28:38 -0700 (PDT)
Message-ID: <5b21c4c9-0ef7-41e5-a3bb-5a48a0c73644@linaro.org>
Date: Thu, 12 Jun 2025 15:28:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612142306.3c3dl46z326xvcud@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612142306.3c3dl46z326xvcud@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:23 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>> That's why I don't like the DMA mode in DSPI, it's still CPU-bound,
>>> because the DMA buffers are very small (you can only provide one TX FIFO
>>> worth of data per DMA transfer, rather than the whole buffer).
>>
>> Is that right? The FIFO size isn't used in any of the DMA codepaths, it
>> looks like the whole DMA buffer is filled before initiating the transfer.
>> And we increase the buffer to 4k in this patchset to fully use the existing
>> allocation.
> 
> Uhm, yeah, no?
> 
> dspi_dma_xfer():
> 
> 	while (dspi->len) {
> 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
> 		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
> 			dspi->words_in_flight = dspi->devtype_data->fifo_size;
> 		dspi_next_xfer_dma_submit();
> 	}

Right but that's before the change in this patchset to use the whole 
page that was allocated, hence the next bit:

 > And we increase the buffer to 4k in this patchset to fully use the
   existing allocation.

We were allocating for the size of the FIFO (multiplied by two to hold 
the control words), but dma_alloc_coherent() will be backed by a whole 
page anyway, even if you only ask for a few bytes.

After changing that to make use of the full allocation the FIFO length 
is no longer involved.

