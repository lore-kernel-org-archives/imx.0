Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE34D8CE;
	Wed, 31 Dec 2025 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147505; cv=none; b=FkQ9GBFW8DlxSbS+VZZnQyCGghVWXXdXdGZn0Wa5U7B/7RzQ62ibViB0H/pfJ8Kj3QH5YvNFLPA3hSzqYH8pv2WJWhC+s4oScWv0mUVY2jpqYWAcNmf1scZ40YfAB5IFglUEAOvc9AxrUvFWxhaExfQTl/M+YwhX0yf45eHW4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147505; c=relaxed/simple;
	bh=pRWn7rpvOpmSzAKdEiA8vbbyCFJU68TB0Ux+WK0H2BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qv+jO98kBOKy7SroHrOviKyNsp5yO+tTbZAzIfVORSlpom2pImyLD9QNT6k76Y/iigraoHcEb4un9etR+oP3+8hxuiVhFkGsjhLstbhkVvRtezdhAUDArdLxdR9U5zvSLYv4giELQoVlghwkCz5qj9SBfeWz+j6ZY8yF5l6SNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TApW9ab9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TApW9ab9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEE2C116C6;
	Wed, 31 Dec 2025 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147504;
	bh=pRWn7rpvOpmSzAKdEiA8vbbyCFJU68TB0Ux+WK0H2BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TApW9ab9gCZrjhqfr+HCK3YzhyrgTmM+8Ow8r/d9S9I5fWmHLIhWMY7VejEvfgNhm
	 ciYsdC9wOzZmW23lqoMZNUorAS1n0XW7raC36zW6lXhPptVPqB8e20C8hmkqNO63z3
	 zD280rUCKy7wOnQgIMH9i8Z0l9G9Km+3Jtn2aGrkVcJxTJQGJosDhhHshCUBsDg4C2
	 GvMPZCG/b9DNQXIjivNAQUpu5QJLLS3LWUxmoq4A+AtVe+rMaU8MsWNndwOAD/M6K6
	 rXX3n+kRYoZ8WKdeKnsBpgG2Y4hNk/x9MRtU5NUZPxcSdrq6/EElnHduWI5Se9Tppw
	 oh/4vkG8fH4LA==
Date: Wed, 31 Dec 2025 10:18:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and
 related nodes
Message-ID: <aVSH6zOaXqmVfwzq@dragon>
References: <20251229163101.4004478-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229163101.4004478-1-Frank.Li@nxp.com>

On Mon, Dec 29, 2025 at 11:31:01AM -0500, Frank Li wrote:
> Add camera ov5640 and related nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
