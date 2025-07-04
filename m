Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A030749E
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637069; cv=none; b=gc9HACINQXmMKFJq25mgiCZOH4ADT2uIjvjDNrZT+hQDlxkUkueOHn0xWvwOAPEDJrVTPjiWlp8hig9+pCLM3n27ajTIFCvQhluOFvjr836pYJ8oacQPzFOtWrL+hNKSTIkfukS5mqsvpExZeUuv6cQZ/3NafGnUkqbrX0rqtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637069; c=relaxed/simple;
	bh=+UyVNx3d2xsOsv3hlWbLcO0faItygFtG1VFebtg95qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5gyX93ztPXu+x04ayiaQKZOImTgOxi8cNnNNxaKoWDiqnDplvVIYImgv8odLTS+wulaZEFcuTnLLSOILhYz7tf6OSOofgjN9N9Au4UTk/hj+qoVuLrlwEqn7etz7o6zISYE5PkV2CjqeNEX0l1wnoMd4CO60omraGKvWKiq/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=txJBri/7; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="txJBri/7"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d3efcb9bd6so95395285a.1
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751637067; x=1752241867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=txJBri/7fJBLtFDJKPXv1naZTZEDlBCW13go00tsPU6Vy7IqJbzBMbHM2Og7FhDnDH
         EYnXaEZowTevwzPaulls5PR0wem76tdWFuMNTUjWiVSwp7xB5FxqAz0IK3ChBt9/FmKt
         lvwrCOBCWF6/fqh3RdaSEjuywcDbtLOH30fK52VxYjlDiaoOGSRfW8/HysaazaUYzmu9
         fNzH7DL1LkJP+urW36nJdvQy2fFIfu6kU68K2ubW0F3yUB3EaAF2kYzdcPlYn32DxtPq
         84gvpv2j8rOBM64UC29sPBX+0wLZ8c1wsPkkFnI10dMxfZ6YKtZzs94dwxmdY+1e+LIH
         oewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637067; x=1752241867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=soMLcxJqZ6RDGuINy3RX5vd8mYOLM308v4tjxz1JdqDWoH49pNjpWmU9JQXBGxvHJU
         igiz57gbP6so+sj+Bef1ZvPOvvw2XJQuiCdIuQrBj9P/HSDhuxQSNxaS500XJP4fCPR+
         WZVNA1Zi2bGAfaAzqV0qQ98/0RuQhd3FcW7KMZ25H8/xtsGaTnp5U3ZHglnGFmTvOrZz
         vz72ZJ6lW5hkJWDIXrmbK1fxqfR6RTIIpX6Qshh4YmvgOnqMNnSjvwYAyyDDoHNTazwg
         sxxAt0UWpie0pdbD41e7YomWNfkhxm2z2MUYpZ+uTTHomQWbjWKL2s68XvtRSpz4nOb7
         dC0w==
X-Forwarded-Encrypted: i=1; AJvYcCXT9irV0yB+B7JQaPcZg1n8MNEj1TvU0WZAQhMxMCV1Zou7SMJCWIKSUaUj3PgA4HeWE0w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBb+funnJt9d9Nzs7Ub7KoNmso7qPxn2EDYDPWTJ7Xop4RwnBN
	A3isz7dG+zenCd+Ue3a1/R/DSZ2u4+CEAdksofoJWH5r2mvd1b4Em78eNEI1DrU/FQ==
X-Gm-Gg: ASbGncvm9lb5/EYku5Z2YL19JZ67bOj2j5Ydyd5lM9fBOFbGGFedXBoNnHw3jKEAr4S
	GpTgKQsCsGOwtaqlY8diQXvB1l0yAGqwjbSQ09uxCxIdZAAUmeWMO5ZMa3Uqn3E2s0o7mp+uL/D
	m4GnNKTRuQIjiok1Df420MXjfg6+Cu5lrNtNYY6b5yg74ABF+o6m7MXTMhAHVnXmaQxIpxDP60Y
	2bG++WkqjKvS1nhAbCkOYzn3czHiEo1xkE3bkCRJJAELnAcGmEUOc+eUPSLkk+RsCTzCDE9xpzC
	Ka7PoPZBwJCdHjgRvdwvFhtvFrMHvGgcj4v40vRbgw6KjmjGxONI2Qlvra+Tl14=
X-Google-Smtp-Source: AGHT+IGPrA4k9Zr2z8tw+Z35KFW9UzX5+1J5nLqm7+nyYdjjQoYkcLFbaNyTIqAXeMIcMfmr1ExyVw==
X-Received: by 2002:a05:620a:198f:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d5ddb7ada5mr262663285a.29.1751637066601;
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ac60sm12583176d6.97.2025.07.04.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:51:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <afb549d1-a7d8-47ee-83af-76faedbb55a0@rowland.harvard.edu>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704095751.73765-2-xu.yang_2@nxp.com>

On Fri, Jul 04, 2025 at 05:57:49PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
