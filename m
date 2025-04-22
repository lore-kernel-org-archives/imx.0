Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0A27CB21;
	Tue, 22 Apr 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324343; cv=none; b=CM7E9D/QMNEe6uq9APr38WW+QcEf9dYiAaxF4jMQygGIZEZGGOsipp2SZs2+CJMJ1bbuWRWJiC+nsJ45bvNmH0ce5S7vr1zgXCA27oD7LgeeKduphUKelNAFRulsoOx+T+g5DB40Ty5e4VxE22qtN8kRzZ5qiARmczJgjlul4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324343; c=relaxed/simple;
	bh=7pJRKtnZKLUp8WiXyS4VSdJgLiLiSgeoG0KK1Z9lRZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg2SYFcSiPVImuMb+OCr/z7gSwQut1MIdQD2czfCBw+SRjJ7E0jP6LtPVyAWWJVWIGmlN5/0AbmXumTznRgf/OhL95TgM4eKBsOGEg9E8mgjl1Qrx+XHN+ID4N5tRz1X5zTCuSBgYxlTZJwsRF5NYpovcEVJPkqCLdy61jj56lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJExs/8Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJExs/8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A64C4CEE9;
	Tue, 22 Apr 2025 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324342;
	bh=7pJRKtnZKLUp8WiXyS4VSdJgLiLiSgeoG0KK1Z9lRZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJExs/8ZeeBmCuLuvTSRivRecHg5P/wEFGNv39PeJzuv1Chy8e4jy6zYfs2HKdQQe
	 +OA0LHIPZttPrqbC8FD0fVPugj+dOXbgtxwkXaXWpa3YOdjN3g8nB5hcglrT7KSzUZ
	 pHn98Sb23t/v6hQ7knQ8GFU0iXu8K+Ik/cmaADq4C0ljG3p3c129uKjjCbcJ+RElzb
	 hSpBR/45tqkZt4m322GbVSsM1gilLvS51Va7jeFwhcGiux5GBc5qYWXm4trx6QEivb
	 ZUIIa2FJNL1gKYDWrrrSRj4G+Hm853ndxA5w6t2K8Vm5fLQ80YZjWemTvng7vT6LYQ
	 ml590AdLx42YA==
Date: Tue, 22 Apr 2025 07:19:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: imx@lists.linux.dev, jun.li@nxp.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, cw00.choi@samsung.com, krzk@kernel.org,
	myungjoo.ham@samsung.com
Subject: Re: [PATCH 1/3] dt-bindings: extcon: ptn5150: Allow "connector" node
 to present
Message-ID: <174532434036.894543.18119458381295464612.robh@kernel.org>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-1-xu.yang_2@nxp.com>


On Wed, 16 Apr 2025 18:59:38 +0800, Xu Yang wrote:
> PTN5150 Type-C chip normally binds to a Type-C connector, so allow
> "connector" node to present under it.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

