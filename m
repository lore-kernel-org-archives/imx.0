Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B538E5FE
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095053; cv=none; b=sp5URhV1/6q5K+D73wdQgGTxK6IroqYsyAHcKKisOgMwyuW4PchZCz4l4dTa/Jzc0ibbpokFEMZS1mOekZvOlv1tYv3RTkH2w7IWW8YY0qww82Act6dkSX9yi86ksvUCGkXwx60XTQ41sekvU3t1lQvDxdZGFnkb9x2ohGbUeEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095053; c=relaxed/simple;
	bh=p74FA63573R7vSgP0Ymlo382GmnT2c2KE5hGfqtfC/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F25VdKz9/dHhy1DG/C79gB7RwcUc74+f+3e+dnSQeatkYagOjYcfF+g0nD7hKpA/DCrzEnJeBghpWQUOJ2zW/BHZqNBt+2yK+PAYZSMZpET/0iySw3X42BAKVOrTdHT+bnjlIFyvprxVTjpkCGM6ECGoYgflL9q530unLIjFS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OIgmICS7; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OIgmICS7"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d74aa6bcdbso835016a34.2
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773095051; x=1773699851; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=OIgmICS74MTgnnE1msfK+IMzhcpbSSPCKuCplUtbAj/rw9Zse0R8u/ueapwH5EKZLS
         dA6KnjaH+BfqhWyL+pEBVnmMiYp59bSPuj5padsFrTFZogfOv9eqmM6XT2ErSCp+GVy/
         lzMS8bSq+3sETvjtn6KAIPb8lxkjMJqGqUZTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095051; x=1773699851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=DZYCbbt4SgTyCMyzmQ9v1IPGKezFxJ78BqT10ybdIMmNYqmFQsfQ4X//CUGul61CWu
         dPUht1D8KOFH9j7DfZt+kLAO0HIn1JcVjuU7dnvvRmlZ8ubRkX9okxHVGeSOyHXnaiS/
         azOtR/GE3+KVtkARZ4LZzhUG8WvxriuzbLVobW8QOTsN1BXcEpDOsmkHGInhEaUouTFD
         7X3flxupDhqbvPojnI7x9ABQFzbhYIGU9RVFFpg3cKBctV1NbjTuAw2eBdP5RfQ7BGaK
         esTOfK1de/gXtUCYq8Qplesc6KmmCWNvSxkUzzTiu//w0zbltydhOWMXmnU4flxQS4L1
         /jkA==
X-Forwarded-Encrypted: i=1; AJvYcCWGsHgBuTlz+ZZEVl9dgcDi4wLLS5OZUXMYTE8KYjOh/8V4yhbeMVOYjVMm/etpfZ1YTnA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc/Zci6J0hJxgOS+Tf2oIzN83ovryQPVMpM4hNATPzmuKT3jOq
	5w/GP1wEF4+9O/2GGQB5OmGLFEJXFh1GQPdYtZsj3AA8TwlasZKf6636jj+3RTnvewc=
X-Gm-Gg: ATEYQzw0wCbdswscaxmZp2BsDd0jDG3b9iPZp96qzWiGt6IhW3SoFbsfGAj5nBXsbfC
	rkHTYKEYDyFrhBGweDXy0y//sy7e6mN630ts5Y/+1Cp95fBfX5+M2j82sOgJt4ZmWYenhbeyHVo
	qDZeuo9ZoA/Tz3yhZvgMOZd4JzvB08MqauaWxi5ot8APceHW06fkfQtqx+W3H51q0esQcuFmZgF
	Zs4LXssPxnSzufa02yPcmeDpTmR3mfsqBuFSYqKMYqdgKjURwUyLkRnA+xEZU4gf1q0BM088AnU
	H6hoOl+WDTNPOkhtuSIRyLaylHgjtwDwaTD2n07RPxMOln4jbtaTs8nMB1/t4GukjRBVAHfrcEl
	13+9EOQhkI5uA3fq3MIwWnVlGVvqacBGNHs4vQ9QlsxV25IbekWTFFZc50d4vwEIVE7yjb9WGO6
	IV03nh8YKedw1vq2v+o5/HUNo21YeuxAts/8I=
X-Received: by 2002:a05:6820:151f:b0:677:d91c:2e26 with SMTP id 006d021491bc7-67b9bd3a2camr8004764eaf.51.1773095051333;
        Mon, 09 Mar 2026 15:24:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67ba42709e9sm5372733eaf.0.2026.03.09.15.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:24:10 -0700 (PDT)
Message-ID: <03136b99-1bcc-44a9-bfc8-bb4ee96c5414@linuxfoundation.org>
Date: Mon, 9 Mar 2026 16:24:08 -0600
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
 <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/26 14:55, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 267 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..0f0a3ce3806b
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol

Let's expand RPMSG for the first time. Looks there is another
RPMSG acronym that is completely different.

The rest looks good to me.

thanks,
-- Shuah
