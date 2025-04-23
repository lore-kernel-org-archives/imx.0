Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7F821770B;
	Wed, 23 Apr 2025 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411565; cv=none; b=B+VUDM4aH7YNkZuE7P2G3bYyosIVW+bALxRwLqjRf5fALzKsX8IagB+IeR2g4hlERKCWDWhCqVV/JNKfVo7FQ+KVyFmD0wExsw3T0V5GtcgSFIhHvSi6heKrSrXfmBB9QaKNW8irxIu5W+0gca+3UZrl3AfDxvzINzzWKOMZmPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411565; c=relaxed/simple;
	bh=G8YtYEDZ/tPabTjfHJIqy70w3hENkhgWAWYVKIgYLrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN6OrNS6BQvCvI79IkiXSM4aJ5QZEFS8F3ueqxiHBlwb0PZ290lqlz169ngtHI2L5rk4Gwyk/YOX21VvMgbw9rV80Q21qiIrLsHZPdKVcRJAQG53eRdgn/q88us57FwgiqJ9nwShh861fMnz4e84aqpfc3AiBUqKsSWL3tJiWoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/dsLRNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/dsLRNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A21C4CEE2;
	Wed, 23 Apr 2025 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745411563;
	bh=G8YtYEDZ/tPabTjfHJIqy70w3hENkhgWAWYVKIgYLrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/dsLRNAcaDyWHGhwhn9vp85Ekqe4vjzvPQYKOJANocnhEkGruVXfx/hv3zPGqgwg
	 BGhG8hHfenTTAVNwi9+6ezz3Kq5cbbXyrLlX2XSm9WgAIqwnzWvL80IyXgttT6pFWA
	 qpYO87fbEdkWLvAGHaRtvWiKrVKeFWMdLlCUvHhq4u6n9CsepZGLChEuES/f/tae6W
	 PtkKFDhnXXfeev0nckPrt6esISuFRJAy+qpXQALfF+O3TiSOOFfvLqDV1OtUWt7lSG
	 PhJSiJRg0CYo9snW0DYKRB3ESAnewwzsf4H0pDXqDTCbqiwVAxpA1VTwrKhLVS/V3C
	 8aDCCBJ8N8pbA==
Date: Wed, 23 Apr 2025 07:32:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, cw00.choi@samsung.com,
	imx@lists.linux.dev, swboyd@chromium.org, jun.li@nxp.com,
	krzk@kernel.org, heikki.krogerus@linux.intel.com,
	myungjoo.ham@samsung.com
Subject: Re: [PATCH v2 2/4] dt-bindings: extcon: ptn5150: Allow "connector"
 node to present
Message-ID: <174541156119.190674.10305656515924366680.robh@kernel.org>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
 <20250422115055.575753-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422115055.575753-2-xu.yang_2@nxp.com>


On Tue, 22 Apr 2025 19:50:53 +0800, Xu Yang wrote:
> PTN5150 is usually used with a Type-C connector, so allow a "connector"
> node to be defined under it.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - improve commit message
> ---
>  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

