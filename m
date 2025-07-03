Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F02EF66C
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555469; cv=none; b=IB5E1aKdBE4VJLAhoWv9SKVUIV9LV6Hm9i7tBvrGGHlwWN4E3VqKJ9ZGQDBkW59u73iMvIox7NzPI8gh6oviF0vOhl5xfx36V9XTLZHZBpfYzSkqGP0k13QbzGzO/o5mEjxOAcm6QotjY0km7NkADMbu+U7nMzCUBTGh29iAvpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555469; c=relaxed/simple;
	bh=QGSsl/5Ibq08H1mWTYhreoVrbh0mx1K0v5BCTNTA59s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXauEKveO5A7p6C/lYhsS+kPatc9T9mxidnBKuvPwnyCs5HMp3edqNbj0N7eQfnGziV73Zz7Dx9aUMQo1qXKB9CBprjRgMgAA8XmR71XUno0VqBzOKzMTPqXeI1BfQ7yWAx08zyShsE5aPQ7kAbjJsQV1FdeYut10gRNPkiKt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvUoN3/A; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvUoN3/A"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso8860107a12.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555466; x=1752160266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=RvUoN3/A/iZjLKhkn0LHEVAAZ1llql/PcubhvqQ/d32xP8pDWD2JrJCEuOi/wAZL+I
         vBHYjObVH/93Nvcvbx+Ih9sss2FrM+NoUcJ893MtYdJDlzYNGNATArC4A9V8GGJMXByb
         +MLjOLyxj+jOywU67nh/C/BRfgdPFoOFKNHGplBnlbgzB/M7E2c/fWVZ0EDHLapAHdGQ
         /e87J84IX7szJHx3rjZD3PNw5XJyN74eqb3jSC0esBDs0rC8FP3mGCJnPyCK+HKkDXHE
         IvoCMOZvFBzJFZ4sZQsuLTkRtZX4C91pxYNB/y58+mA4Xtsccj2xWCsR3fnuD1uhH9+k
         dlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555466; x=1752160266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=MJ8y7cRPAGTSc2dcSNarRq1qBVk0QIYuJyA6sjlHoQdkJxuEm5xr25DlgUcTXHYRLf
         wbbvI9BAAt9n6+0QXBqC0DByEItnF+Ea1aKx7rHEmNWoEQq3IOT2Xu+gdbUVPjzCwl2B
         1/PXe4qSt7DYys0HJMt8cNjUo3B7HGNod/4dzjV7OrrXKbLMpW9WSJf3Vw4tAFtlA5Dm
         tg9s9yN5OctspuufloyM6CKRNxUfRn7o11sP1gvCXD24IK3YVPzmxBMIlBTM8XKvujx4
         HhDR+2e0uSq3S837BJQYSSwcLvOB1wFB8oM5c3+auXnH0bo9AEXB2iLSUV3I6iufFGQd
         H+vg==
X-Forwarded-Encrypted: i=1; AJvYcCUSYEzaHyZsJU1rQ8ZXlQD0KxITjfFMreZ64stNpGC7Wf7EN5D+NHYHgQ/A81vMqNAHld4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCVn2f78IM49MKCdqyYo2sRdmX0P7rOGCaY/L1RWsaJmLytCc4
	QG/fplLe2PUPXb+l32KfLPNP98tjugO3DfrHKPwtyHRzM51YnZHO+z9ZRGql+jF8njY=
X-Gm-Gg: ASbGncvXId5qCdsyLqc8N8mNWy83hY41IetcEYiPNio3Neb+93NxUTZSL/olzJOevhq
	LSXVsbxNblHFsNRrpDPKk+48vRO5sEDR2+daxk592eHj1YTfwZFVqYPw35A71lAAcT0MC+bAJVP
	L8uslEnEADYG/p1FpEb9jWdG5zyL617jDw4DHAJI3F7j7UjzgzvmZx7BMQwLQsMlgtCowJm01iB
	ali1Y4O5qH8gMwUf8ZqpeSVTciVjtBDNuAPlYjmDy4t8Wr0O7smZrA3+aP0VcVSJBKvftsV9axg
	kpXDgueqTxVGHtkzyiFnwe7LWzJOhplUJAyDWSzDZdDmSnkbFUqHo13blro=
X-Google-Smtp-Source: AGHT+IHzpMVd5ZdMJKAden1BEk7leNnkWoWJcBZRiZrrIpoemL5vbs9A7FF6CC6wG99E12R7ltKp/Q==
X-Received: by 2002:a50:a412:0:b0:604:bbd2:7c88 with SMTP id 4fb4d7f45d1cf-60e5350025emr5522209a12.26.1751555466332;
        Thu, 03 Jul 2025 08:11:06 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fbf791d06sm258603a12.2.2025.07.03.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:05 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sandor Yu <Sandor.yu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix
 csr blk
Message-ID: <aGadiPWIKbqDVek9@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>

On 25-07-03 11:40:22, Peng Fan wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
> support for i.MX943.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
