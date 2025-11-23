Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68D36D4F0;
	Sun, 23 Nov 2025 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763911976; cv=none; b=tbhgJj+tNHQMuxmZIjK0va5R/iDh87CGwPz2MnzA4ULjiHwpv8Hr9iXIYWS9eh2bLNXSFsoaHHEKrTVZ4kcuh0BTZUi8gg/jusTljKdKtSuvPwiW/g/9OekqEMQTKX+YtNAbjJZfkUydGWFVyqC5Jgk2UXn1uXoCqLLRzTcxqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763911976; c=relaxed/simple;
	bh=UoXC3Z5WQzMeKawOjlWThupL7ZtZqV8ue93gfLZdDy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruaJkfnLHcwth88nxX7vlYLIOOph2u7AKwJiXnIaQnqjDdWl/ilECs6Ka3wf2tFcNJPjYtK7HguSHpNB8ikSaBoETdgjHowAhJgr/K8hYesdJ09W2qDaO71IYMVuRxtxX/q1teiu3m/oYFf9WCxHxPt8N+uSOdwncBzJ6wuTiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaTi/P3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaTi/P3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9620C113D0;
	Sun, 23 Nov 2025 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763911976;
	bh=UoXC3Z5WQzMeKawOjlWThupL7ZtZqV8ue93gfLZdDy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KaTi/P3KI07lplrSwVv//oJUdvonaHO85EP1qGrNaahKUXP8L4+4Wht2qlW9RD8os
	 52LvVXOwxCCrGYAkDpCyB1+dH1mSWGEcJWbptdlC5NJ/HN10fO0R0f5Gc+R2wPF0zt
	 prNlcX/ULGJ8p9yOkfi68mwTzvNtXyWWKv/pdhQt9WFcHdpXdw7bPzRKThgvUoAS7Z
	 NfxZoRktDtHFI//Hz7SEYMVKtVEXkI5pNJ7Awjc6o/5S1l8xsTaEbC44vnW6kc3QlG
	 7Ew9lRzq8aWVAcA36wYVizmH7q9XwGNb8QZbzUxeszUTnBJwudeiWAhHAI3xrR0SGh
	 ZoEGUHnjwqRQQ==
Message-ID: <c51e57cc-2098-4d0a-86da-46bc77aa258d@kernel.org>
Date: Mon, 24 Nov 2025 00:32:52 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] extcon: ptn5150: handle pending IRQ events during
 system resume
To: Xu Yang <xu.yang_2@nxp.com>, krzk@kernel.org, myungjoo.ham@samsung.com,
 cw00.choi@samsung.com
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20251115025905.1395347-1-xu.yang_2@nxp.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Content-Language: en-US
In-Reply-To: <20251115025905.1395347-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

25. 11. 15. 11:59에 Xu Yang 이(가) 쓴 글:
> When the system is suspended and ptn5150 wakeup interrupt is disabled,
> any changes on ptn5150 will only be record in interrupt status
> registers and won't fire an IRQ since its trigger type is falling
> edge. So the HW interrupt line will keep at low state and any further
> changes won't trigger IRQ anymore. To fix it, this will schedule a
> work to check whether any IRQ are pending and handle it accordingly.
> 
> Fixes: 4ed754de2d66 ("extcon: Add support for ptn5150 extcon driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - make dev_pm_ops static
>  - add Rb/Ab tag
>  - add Fixes tag
> ---
>  drivers/extcon/extcon-ptn5150.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Applied it. Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

