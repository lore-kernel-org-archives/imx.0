Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0FA3FE355;
	Thu, 12 Mar 2026 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336896; cv=none; b=WTU2okTxzMQDR1C8WKbtF7BixI5Wa76aaJAH8annHgd/J9EJHm6AnQvtroRqjm2pyuULbfwl9fJH8KaUSMmfRUodMGsnZwUY1NChpLy0EeIBex3XJtkodilkKQkkTJ3IjBZ892Mg7w6qOx2VunO49bnHOYXlkAVBxX38WMQPC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336896; c=relaxed/simple;
	bh=1P/4LEDixaG5795fXNa+imLmGsUhYup/VzfnVGfW448=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vu9pKRTV6KmTzmYYURVrUDjD3yY5MoxSdbMmuRPeu/wNOsSICYKrORr6gFgZEBq7x2dD/cVS3u7tsVLmbKWZ2WVTvtg+MyVwYReW4AS2/Jz6iJPD42W4JLDLL5acuc8xKjzVmRNQlGmYfiMbqTuPnel2IfYmhwYmqf8KB5G9k0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAgbn5AM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAgbn5AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670C4C116C6;
	Thu, 12 Mar 2026 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336896;
	bh=1P/4LEDixaG5795fXNa+imLmGsUhYup/VzfnVGfW448=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MAgbn5AMI88SjayIfMB2INHSkO8tWC3oAuUJnsbnpD8esZko25GroRBu0rr7pxGXA
	 oMFAErOunk1D1pzpfqBokhKGZ+yHzEJGL28ibFyw2GPI9XjakegjPRypTibjY1z5MA
	 moC5bsihWNy/UvwRpBiG5LTlQuR9sf/cSFxGPtYoc+rQnFoc26V3VQMZ+TMaYSgL/Z
	 Y1PkdrI16DZZHys4UuouOLcEwTRbXPXPVkkY/hl7vc52u4WxcHXB3tpI7SU7Ji8nmI
	 HV99sH0XeNvOIa/56BmAL2vIRBLSPiwARMyll966xTP6sOWeXzrgJMio/w8PVACNXc
	 7Uf49FUP3G5GQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, andreas@kemnade.info, 
 Robby Cai <robby.cai@nxp.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260312040148.GA4007088@shlinux88>
References: <20260312040148.GA4007088@shlinux88>
Subject: Re: [PATCH] regulator: fp9931: Fix error handling for optional
 regulator
Message-Id: <177333689516.303201.7873451488433406012.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:55 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Thu, 12 Mar 2026 12:01:48 +0800, Robby Cai wrote:
> If "vin" reg does not exist in the device tree, the regulator framework
> returns -ENODEV, which is normal for an optional supply. But the current
> code treats -ENODEV as a fatal error, causing the driver probe to fail.
> This patch fixes that by handling -ENODEV correctly for optional regulator.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fp9931: Fix error handling for optional regulator
      commit: 8066a5855ed986f822df4d8b1fa8017b88a43e76

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

