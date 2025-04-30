Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3764421CFFA
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034182; cv=none; b=n2/Z1PtX64hDbk3ZONxnXTF/LEykZqQHVci00kpmS3BDfY4fMkLCCRKF60BHW0oKO+qRtxXz6YYj6xe2C5Fi6bdclCw/BcSRYmzTGcGjafzCbtsUbzfs63Q2eRqFQGVFYAW8cjgIb6BqAJJSOPx6Z2eoGV+KE62hgg52ytGaKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034182; c=relaxed/simple;
	bh=8b7Bqu3LD7foyjvQRHymGo1eOumlODvyLsmaXgPy/SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTMbnFu3Z5qfNd4DceC98i9rpV1CRZWDkU4way+co0lyFUFTHaFQOfXleKxdAID3f9mUutfSXEhODQr8UmHeuU/kimHgeW11kqX3lKK6zx0RTetlUMMYynxgjWqaG4aVKmsTJw6akvSSCWrqkv1mdQlNVp9+/w5f9p/bx0z2F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N5BL6lDr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5BL6lDr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso43312f8f.0
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746034178; x=1746638978; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/d2mdUEZU0W5ewPmxWru9I72D9hiUx6jBl16Iw4eyIQ=;
        b=N5BL6lDrHW1LKvnrqvgs32ZJyak4fQrhZvezDe1zFdbIrFIxfmMCIFjXtdtIuf5El+
         PFBQN1NCjHWoj2u3Oe3pVU+dB8edD7qtjFrJs+lsogzr9gF2UeDuP+5twuem08uh7Zzi
         Pszk2iFWC22tiLbWWe/lUuz2OmvfUTYF1fel2XaYCCCDpI3n6EgvIJElftlrKfxMqOUQ
         0M5umVmj+V8wShVR7IB88cgxIHDR+aunIlDs2HBPKF2iBANQeKd93jHV1W4cy93C6r6z
         b3+VTjpj8KWp3GnAk7tX/BEHIEUXpwNjGOxuCoF9K4rmNPWkPDwwh1qKFW99Di2/teYo
         xJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034178; x=1746638978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d2mdUEZU0W5ewPmxWru9I72D9hiUx6jBl16Iw4eyIQ=;
        b=LA029WAs9uhOVyKJxTAHfyf6+YKvN4+lkNtjRp+HvD+u3W6OTlHyowS9/TWFI0iTTo
         OyWCgJJo1Bk22oBY4JVQoTpXRS7gsmyUapQrstH7avoO0S686VOvs/qoH4S/gXdwMmJn
         uLd2regRHBACFqqDdgdJ3yxGFO7vlwxdK2PM/SKG+pZmIRezPFLowpHARXSsZ69xVs9p
         1kTIq5LxNBlrhRf5VPkc8iFt1hveizzyITGvqrJtH4uwxcIWE1yPEntue6+epdmFtmn5
         9kobW0bh4zcstv9hc1dqTSdWS3qTx/y2JuxpCf5chorUueqeY6PzWMswLafJa01V99Ea
         rGgg==
X-Forwarded-Encrypted: i=1; AJvYcCVTBVxk+c5bGTZ+0gN+wApqRE/Fx+W6MIuZ8yU+vZ5JxbH/DtGtPGy96GNcS01HsWGk7HA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+we3skKx21RUkU6taPUoj6B0uxxzd2ymYi8vOpNZeA+NmZsYq
	OfQp9Oaletgg22Oz7XcOrkqb+hVAqYLDv5w2khINpqRlrAL0v4bCSkoaQz6Qo+E=
X-Gm-Gg: ASbGncs38+yEQC7/HYtIDKHdCQU/1VSr5grVt8cU5dwNMO1uytk0m3veZ+N7pwHgihv
	dUJAtkWgpYboW4pB0RxLFrLZHM6TiqXU7X+xWiXjXSeZiqiImHsoe5bSBs0mb9kd/cQ13UcyL4s
	x9VXEXuQ1pNupSZn4zhPdzcvCt81JseFh/g0Keh7nH3oFEb1v/YC7JfwsN5BqlJulBEEC7CAQKw
	8KNCIW8AYuCpLU+M8wHntRoTjomnsoigxvRASrCSBmUTtFqxv8ruFS3dswAokni1m97AcE9czSr
	U4rjde7oprgYgF+R4aYNrWwfMYNQfO7dMYXXM11KvTj3UkxLOdLbOxo39xj02hT2oh/Dq1ZMbFo
	vNVY=
X-Google-Smtp-Source: AGHT+IGs1c8sYMZsyj9z2U0RULcNOGnmtGihhFGKINWCPv7w8C/Dxte7jQvye5V9MA1ApwGcschH3w==
X-Received: by 2002:adf:fbc4:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a08f7a4abamr2974046f8f.52.1746034178446;
        Wed, 30 Apr 2025 10:29:38 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbeda3sm17724596f8f.50.2025.04.30.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:29:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 19:29:36 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bai Ping <ping.bai@nxp.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: timer: nxp,sysctr-timer: Add i.MX94 support
Message-ID: <aBJeAFb0dBYAMTqA@mai.linaro.org>
References: <20250306170902.241057-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306170902.241057-1-Frank.Li@nxp.com>

On Thu, Mar 06, 2025 at 12:09:02PM -0500, Frank Li wrote:
> Add compatible string "nxp,imx94-sysctr-timer" for the i.MX94 chip, which
> is backward compatible with i.MX95. Set it to fall back to
> "nxp,imx95-sysctr-timer".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
