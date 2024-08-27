Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37BC19D897
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751329; cv=none; b=DkNCSglgvCc0v5XEblDH4fMl39JMsIny7e0xIREVco5xOznmDiWalv5NzL9UKrHa8kIR2ZbNsYh9ghiK3T9xIF2VhtJVEoaVUv5PDDXyypojsrI9tLXI4cY0RpiJdms9+rZpAcX59dIkze1la/l+0+rYTstDn3HZVB6AuNPVfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751329; c=relaxed/simple;
	bh=/qYEaNO0f0/j0GNVdDMtDz3dnPGIlUfEcopvMXwrDzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTrnYASEKisfJUbpLiyL4PXZpAkRJpmJ6I2fSS5YKL9JJE+7UWA+oQ5UHbodw3ORT2l/hJI4Pa+ZlCidPNx/Z75V6mDfWq8SXykUUSrhv8Xh15DhnmcmUC/3TguM1Dy63WhifLV3ZirCb0uGJ8PToGtI/R9dWp2z+bKn33O079g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m//l+ieP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m//l+ieP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3718cea0693so172857f8f.2
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724751326; x=1725356126; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FwvkZPahHcoAXP/+I5Y9zpq7z6mvaxa3E0EjT/3SfIU=;
        b=m//l+iePEAsprhMRb+cZAyhFntUGndcM5yQWNoebk89nh+uPMMLeBsRoHM1rbzh+eJ
         gfAoyhgtvg7EAwBoT0B6HaEO68X1JIBafA197wfNKRRL+BlwXQfwPSGuYtVuwIgDXgAD
         5BIu6k3QBdhzNmsxY3GJyN1NMxojSZbJ44AqXc9M8xzvcLE5um7dkVymJSv6LS2AY3XA
         +eTE6cdQLrdLZp0QL1/iOQq8Tn1H16ek4slPgZVsiRZhQ1ufVQt4V0ti5RGKtidXSqYP
         BU7adAlQJZEcq73hwha4E/QVtek7QtSMlfUJwwd8BrPwWa634+zHvtqfSZqYQhVNI3e3
         0hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724751326; x=1725356126;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwvkZPahHcoAXP/+I5Y9zpq7z6mvaxa3E0EjT/3SfIU=;
        b=lvs+4rcm/Vr8+llGZrqgY9OeFnLrJrMvS0dX5swPziEDyY1VLH254eMFvfbVSxCIBT
         Znjb7SzmERNfR7wvPN/uJ+c7Ia6nlSqIiAXHuUeTtlNejArfsPlY/6B9CjNQccHHsCiP
         ziZtsV4O7S3AfhGV1sNU4SK1fY8CHaV+4H40GCmTO8k+MijmfFi42ed+Xv2Dxmyp7bjr
         RtaP9lb/qGc8M2nDbncyaG9VR75Tpk4jAH66pXw3xZO6r8yYtRpffGLjdV9AisXdljlx
         BipY+ppcwf2iMTjHXqpa/fecJ/ksWB36+mI/yNYmR8rVoRrPhZ5m70J3TcazY9kmgiPg
         RxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFuYGIe3eEg7gYazyiy28jjDBcr52yvxtewQG3G+Fl/+v+5bvlG/b+M/ohMEr+9KYBxA0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZMX7Ltrh0uiYIl4jrg5UpJDGWiy5VSKZrzpWkhobbkS7FFPPV
	4ORT/bA802soG+IP6gBMyRmKaqlm+6PfEC0ujpV6X8HMZ1OASg/oC1QB1+5fnhA=
X-Google-Smtp-Source: AGHT+IGbIMoyFxf2wkJPSy9lJAdsfddn7eHX3cATKuq9Occ3teA1vXlQLSZWmqbpLkgrcqoTcC6ReQ==
X-Received: by 2002:a5d:6daf:0:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-373117c3298mr5146120f8f.0.1724751325846;
        Tue, 27 Aug 2024 02:35:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730817a548sm12592529f8f.63.2024.08.27.02.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:35:25 -0700 (PDT)
Message-ID: <7c6df930-f685-421d-9186-b064d15dfa00@linaro.org>
Date: Tue, 27 Aug 2024 11:35:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] usb: dwc3: st: simplify with dev_err_probe
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
 <20240827011901.zcu3x24ph3bmfwap@synopsys.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240827011901.zcu3x24ph3bmfwap@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 03:19, Thinh Nguyen wrote:
> On Wed, Aug 14, 2024, Krzysztof Kozlowski wrote:
>> Use dev_err_probe() to make the error paths a bit simpler.
> 
> I think it makes more sense to note that this helps with cases of
> -EPROBE_DEFER than making this simpler. Regardless, this is an
> improvement.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Yeah, I forgot about this argument. Getting resets can defer, so this
actually solves the dmesg flood for deferred probes.

Best regards,
Krzysztof

