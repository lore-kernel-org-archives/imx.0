Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E304314A63;
	Mon, 29 Dec 2025 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012453; cv=none; b=i5/xyBn1so2Elhz+XnZhwaUXaEb7yfuYTd6UArM5aPRFYh5GkMIWgnBnKzId/N1lzNK6WnkVebHmHKlLsSJ2KF8X8Vs+ORgmAWZss/APfrJDWbJKj+oEjZbMYGNIr8PJ/r+U9xjfOsFINAX7uVu1PSfcAsK/aP/i62mB0XLgQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012453; c=relaxed/simple;
	bh=G7pASx97A/vPemlyhC2nxadymqrPJddcRTFYt0vkuOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aafTI4FG7sdIN780zp9le8WBVOnyn9ebf+TRjvbHmo68rB6LeeGTdmORRavvoBYsLWa+nf6LKeIc/MPvxQJ1j5ZMADy7v7SxgcQyAGuGUe9FLbTRBKrfjaIJ0FoYcs/5blw2aWLGKUOEBWHHUxlDL09r87feFXH3MNaIczeXARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH24rT5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH24rT5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8127C116C6;
	Mon, 29 Dec 2025 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012453;
	bh=G7pASx97A/vPemlyhC2nxadymqrPJddcRTFYt0vkuOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pH24rT5bBJJ5xtokWlKGehd/didNyCmO2gKC+ll7JQlKZnxJG9hqmzZL15MZFtSj0
	 ETPXd5YHBgTBPrEawpTi4Z54JIG6wLiMkdf3Jos0LzrjkuWahNWhhFhZwxfqRLr40D
	 flH81jb+lllhSLyQPCAxqkPBW8O60aj7dMR3Kf1oQcZydT7KpuvKK4jn+YwF7BX9gg
	 dYG0OEkeKfyyJ2XbfVtrO3anN5R9ucNb54RlqFq38JtMhxZPQhdWnRZ/1w6sNi0nU5
	 Ue1NbT+/hjgNzpDoMos/C2OiW88w99dJxqTUfDe8PoE2JY8599TNjc5oZrE4jlQ6CH
	 sPDXHoTzVhyjA==
Date: Mon, 29 Dec 2025 20:47:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0
 for lpcg indices
Message-ID: <aVJ4X5-Ra2W3hhQy@dragon>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>

On Fri, Nov 21, 2025 at 08:31:40AM +0100, Alexander Stein wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!
