Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776385;
	b=L9RCJxm3MdiD66SZd9Zv+6dSaYs5/PVju1AO9hoQnKGryB8bbhWUW6DHs/sufr6BLhR5
	 ojOu/fJ9adAHsF5G3aXqchx+yTViuFElj6qyJoyZQUIYYqYufBq9DRN9Y71UIQyIc0ELM
	 jrpHfZYahS5xiUy43E5LOZS3IFFfEufYI/gL+WHGKNTsIJ2UY9VllNIb/6sdWMEU9jAx2
	 Oay5WLh36y79zgwEK6eSOAd7uKSIzxNqsWvKG5NAvW2zQna8I8IS77tdHFcTI7TBQ9MSd
	 G+IG298VpCDtuJ0p8QOylWDz8i2YNly5ls+Alb4hPe/G7Agk+/t5cARKK75B/BpRk1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wVOjCbDkHa55vyrbh4K26MwsVy0NA5AwsYenc5G9h4c=;
	b=dzX6Fx7q9VMLzZIevNCDiwIdaDQOkp4/yE9Y6k679Eo5tPDuUuyqnbRqwBtpAXFMe4e2
	 pW8nYJfkPIARW2T8v7L5A0+Y0FEauiDk8GAGeOv051CPuzgVYGT7xwohn3BbEit+yfleY
	 9zbnhh1K1bUuQQXrvtQ2Q+6F4V/SbAI8SFWWTKVK4RmDzSfWRB5zyKvIWxvH0PhsKtab+
	 IArFZMPJUqdfMg6SXQ4Z0N4O5Q5K3aDNTjxHF8YHwIJpYcZkBjvuCdMEAfh8FGxAT3fnJ
	 3KJ645KYDr/xd+158u2vHiMJg21Rifoq2uhyrnVm5h4emKJbSR6Q+eTeglgMb8phOCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlqUiWBk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF5606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlqUiWBk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F741F00A02;
	Wed,  4 Nov 2026 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776385;
	bh=wVOjCbDkHa55vyrbh4K26MwsVy0NA5AwsYenc5G9h4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nlqUiWBkFry4UsU5M6rCgLxE95eJUXttNhoi67bi+5zLheTG4VjCecDWkCDTiN7xy
	 TPznKOHYE8WN6Dl70s5197mImH/Qpp2/zl8qlh91mJwJeI7eeWW6GEkYSRkAO8f8gb
	 7E3tlHz+yLVVLn3lexZ7foqJsWxmJUqAElenPv8PzUb0UdN74Wze/1CF8jSa5dJHoN
	 vNJQgbttbbqXmBD3Kl7XoRE4wdk47wXYoDQCKhInSYA9pGbRVOc+LJ8WBt6wXH6LcS
	 z0YRgL42fuvf0O02r7aaZCCTPWM7cF+IOTrsxBOMsCB8gmIw2FY2c1ReWCLfNZl0qQ
	 wzQI/DV/Hd1gA==
Date: Wed, 4 Nov 2026 08:13:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx8m: unregister the soc and cpufreq devices if
 action setup fails
Message-ID: <20261104-logical-neat-penguin-b6c302@quoll>
References: <20261104021432.1468280-1-vulab@iscas.ac.cn>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021432.1468280-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:14:32 +0000, Wentao Liang wrote:
> imx8m_soc_probe() registers the soc device and the imx-cpufreq-dt
> platform device and then installs a devm action to unregister each of
> them.  With plain devm_add_action() a failure to install the action
> returns the error without unregistering the device that was just
> registered, so the device is leaked and its sysfs name stays occupied.
> 
> Use devm_add_action_or_reset(), which runs the unregister callback when
> the action cannot be added.
> 
> Fixes: cf7139aac463 ("soc: imx8m: Unregister cpufreq and soc dev in cleanup path")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/imx/soc-imx8m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




