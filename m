Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF21DFD84
	for <imx@lists.linux.dev>; Mon, 19 May 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658441; cv=none; b=om714YbUbNlzol7EUW5HyGXWdJ30SYtPAjqlrxawMqwl5YkMxQjXn/OdbxZ3T90SSIwt1YskNvOUlGMmcxWjrDhtzRbflgNdwZxI5Jkx8kE9uPMJNm7kAUa3fCFvKhXWCrqAm6Axo/qfgPJj+WO+Uc+0699/ld+drhrHtOSxqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658441; c=relaxed/simple;
	bh=iu4FteSUj0ekFa/f6JqjR4CTSpOMlJ1sgTDj4Seqgi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZVYMInQ7bo+fjEqUlNf6qfKqSgj+rmsaniDm/dv2lidzBwyGYrcNo162Aa6npTn3mfZL25slHZvH2o4+UfaQaZdPo37yMcaE5ORBNGsgjz1eM5eBPVMMv8N/brnWoWm2c5tkyrEZfAjbD5A6aG+LACiu4bVL76uC7qDHviBtzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+H5zL9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+H5zL9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489D7C4CEE4;
	Mon, 19 May 2025 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747658441;
	bh=iu4FteSUj0ekFa/f6JqjR4CTSpOMlJ1sgTDj4Seqgi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+H5zL9FLUxNhoMX4MC7ZYnV97VdtamNin+hu1Sdb0xO0u26+DypUVxwuIiNZiqQN
	 3pZq+3kTckEf0P1LyRY7KnbY4kPQ2FqOPmgrfpMDLzjYrhtucDDBjqOxT10K6xxG7J
	 nJRuixPIq9DtsuO/PL3Np0iMDxuGTraqbdazv2D5f/xBMQq6cX0rWIWDSqgPLg+MDt
	 FD4bvGd1WrHwqYSFFVpHWICQju/ZohJZFmbrobJPSGLbZKdBAOUvR1UPjVmVTp8iVL
	 mquygSCEodf605coKUIqgQgf7TejV+tG5MNcDI+tkUDuBw583stN5GEv/sSoQlYl8E
	 tqnVY/uLdOQAA==
Date: Mon, 19 May 2025 13:40:36 +0100
From: Will Deacon <will@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@oss.nxp.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/1] Add check to ida_alloc()
Message-ID: <20250519124036.GB16848@willie-the-truck>
References: <20250516035904.GA28759@nxa18884-linux>
 <20250516073301.3144450-1-ruc_gongyuanjun@163.com>
 <CAEnQRZAzPx05B7E-pF1QqAZxtF1HcYsMcskjMw9kPbJnk=YU+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZAzPx05B7E-pF1QqAZxtF1HcYsMcskjMw9kPbJnk=YU+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 16, 2025 at 11:42:32AM +0300, Daniel Baluta wrote:
> On Fri, May 16, 2025 at 10:33 AM Yuanjun Gong <ruc_gongyuanjun@163.com> wrote:
> >
> > Check the return value of ida_alloc() in case it fails.
> > This is found by a static checker.
> 
> Is it just me or I can't see the Signed-off-by tag here?

Yuanjun -- please send a v3 with your SoB line added back.

Thanks,

Will
