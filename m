Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF606156F54
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735036903; cv=none; b=M5pPEYvWyVACQSQaHRTTK1T7hiS26gx2OZHm+8llMVTFzQAs9JGu3w6QFOG6XWhpprwd+3Dtdr/bMeU6LHpifj/w41rCeH033/1fjbU14+zlLmnm0Ye+UXOrXA11J29Guh3xYWkHRvFkg1mfO9ATbr4Geo4HOfHJ0VoE+r+pgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735036903; c=relaxed/simple;
	bh=LaJB8VUdVPRr5gNstqR38wE2S4VTOZE/uhx+Vo2GQ0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TsksUiDRZRKG40CmPzaAUuolec09j5r7CagH3T1B8oJN2uugDT8Rg38J9z2GtYTHUUrji6zi8/28JEO5jNpUv+u79uuK/8+uAWVVi1PxwFYEeWxQnrfOsIWiBHvs0bOzWWJ2bCv4c0iINcoz0ALdjq3+6RQWOtZxTQJNOHUOZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMB8G0Rn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMB8G0Rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B130C4CED0;
	Tue, 24 Dec 2024 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735036903;
	bh=LaJB8VUdVPRr5gNstqR38wE2S4VTOZE/uhx+Vo2GQ0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tMB8G0Rn69PGcCXngkALTbArWVL5i0xJnsQuBHchlugtpISWLs07V3wie8lIXKWnt
	 vnerfnI+gY/N5dYAZR4w126FlWb2fPor9uLWaPwuCTm1fAhu6S9C4C+/LPsqMy0u4w
	 6aSrUAsLYnoAvNGsLVg1+PBRqN+LbgrlLQyYc+vYH6z4rZdgGfyC0qoJ6Brf67BpyZ
	 bRdcVQBuUQGEKZ73OaimxfRaEq/USsAXgXrdiXF2dtoBJRUcuQzZa8UdfF2Bvlfot/
	 bpOtjggZMrDHSTAQ61ckf5xLmkMV2lwOkcYqQNORvml93hSj9VoYr8jYQnpQnV5rre
	 s15S7mxjcnDmA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@nxp.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: imx@lists.linux.dev
In-Reply-To: <20241221075712.3297200-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241221075712.3297200-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH v3] dmaengine: fsl-edma: implement the cleanup path of
 fsl_edma3_attach_pd()
Message-Id: <173503690200.903404.17595202508126932739.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 16:11:42 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 21 Dec 2024 16:57:12 +0900, Joe Hattori wrote:
> Current implementation of fsl_edma3_attach_pd() does not provide a
> cleanup path, resulting in a memory leak. For example,
> dev_pm_domain_detach() is not called after dev_pm_domain_attach_by_id(),
> and the device link created with the DL_FLAG_STATELESS is not released
> explicitly.
> 
> Therefore, provide a cleanup function fsl_edma3_detach_pd() and call it
> upon failure. Also add a devm_add_action_or_reset() call with this
> function after a successful fsl_edma3_attach_pd().
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()
      commit: ccfa3131d4a0347988e73638edea5c8281b6d2c7

Best regards,
-- 
~Vinod


