Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF81C5CBE
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734637664; cv=none; b=VhBbLY159FtXzH7FiMMBVgRdZnTYhAj3zfJlqfFXglOnGnNtmh+SS/BMulwTKGuqEuvImThD8xm/H6OxOZsZA7txP3dZqI4r3L8NC2GwWnJqVQNgI6qD+nCoxQUd3Bk16xjQQQ1vdkiHIXuOyzuRvhXDvm3rQi9UxJJg+7KXd4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734637664; c=relaxed/simple;
	bh=Gypsu5NU4iuo4uY79J11EnxjesDJMDTZYpXBwXuU2M4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YT6TrNd88xD3obZnoVr3FUPNmiYeGAI6QtWvGcyYLg8bEWZ2Gg/wLDG4ec4p81rICkTmZ7y+cgfRoJrKZZci73QVX2T3vmIs1Vf/AUjsS3ssVEZJCZukPGQRhp2sD4BrZOisNmB8WxkibVBOLS+VD5jj928UNIs8bATJKim6bTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2olWgsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2olWgsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8731CC4CEDE;
	Thu, 19 Dec 2024 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637663;
	bh=Gypsu5NU4iuo4uY79J11EnxjesDJMDTZYpXBwXuU2M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2olWgsvDnuBPf9lK6b/NPtTM0tjb0ukt6trrWtb258yTmiW0Ng7DMkIlVBeLCKqN
	 UkYGl64xmKMy79C+dGcAieCfWhObFX7ZF6jc30hDuWkQlcw8H/UKzFduexaoEsEgOI
	 U4J0fG138yswUfhe01y4em4jGqW64ofyEJDS9lUrN7LXY+FN9NNxzU8D/Tlu+H+Ika
	 V4Iph5yBXiUCzPpci7QSZuFaceGMsW4CID3/R7+Q3IknnMpnslEbjo6FRJUlpF+syE
	 kMtNJw82jF+H7pqSPKBebRJJZxhA5ut6bEYSsFBOuWFku5YfGY8y66owTbV+khQOD6
	 NNYM+FYWWAAVA==
From: Will Deacon <will@kernel.org>
To: Frank.li@nxp.com,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Xu Yang <xu.yang_2@nxp.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH RESEND v3] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
Date: Thu, 19 Dec 2024 19:47:14 +0000
Message-Id: <173462343305.3913401.15165333302624535869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241212065708.1353513-1-xu.yang_2@nxp.com>
References: <20241212065708.1353513-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Dec 2024 14:57:08 +0800, Xu Yang wrote:
> The imx93 is the first supported DDR PMU that supports read transaction,
> write transaction and read beats events which corresponding respecitively
> to counter 2, 3 and 4.
> 
> However, transaction-based AXI match has low accuracy when get total bits
> compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> So axi filter is not used widely on imx93. This could be regards as AXI
> filter version 1.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
      https://git.kernel.org/will/c/f3edf03a4c59

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
