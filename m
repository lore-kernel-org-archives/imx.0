Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D07272813
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398439; cv=none; b=YS3m1cwwvggquHnXgXccDlvQyovCexHbFxjfA9chTv+TITC4bwDr1BOslzJoP61oANX5i3xXXS8xFbeTgYWFzCkB/DuktA1PYgneyLwW44BXHXxtxXNMVpDdrTY8l12lNMT8Z0xGbFOlz0VoN69Bwz7gkJNg9Fs9rCHIb6ZXMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398439; c=relaxed/simple;
	bh=L3dR8NudphjzOLY06rRJEZjL9fEEuauxwFNrQodgmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2A6RvjUM50IXVvLR5lNv9Eqx6ChWkUui5v79fdlqSzqpDxAHKGrt2d6PzeWfymAQxKo/KYq+B20e4bqaq0qVfYFBIJ6H2MqqLL1+zqm3Lp9fYiCDYsGtVw5fgdTyvqx32PUHP/8dmJf71Ywz9rXJTlmo/P7DP1RjcpMncW42u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0mkyTCU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0mkyTCU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee07570deso9417685e9.1
        for <imx@lists.linux.dev>; Wed, 14 Jan 2026 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768398436; x=1769003236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jT5+6PNxAsiSLc4phs+HsvpCwG6ks9aQbUheKgFsmM=;
        b=i0mkyTCUev5hQQI97Z13/u+wlu3GvMwumwpS8cP5eTVKNRqAw6qceqflEjfNW1Habb
         6MPTQfMWvc5Byg9zPqkAnQxB5s5xj7BryMfLHbRbYp8tRUekA0nHycb5becnZrtIpTf7
         edourpefIGREx7PuKKrTVVXsUK3+RGjhCDASNoNWSeXwGVV8IsJEZNXA2hjLaEdkRIet
         oIqK7LgAkccJ5TthCfhQpSEQKXZQx3E0yKO3Z4MjsaS3+JC10o6sJ0po4VHG+WNjoIho
         rYbbmoWNczNsjwJR/6DCFORRE0vhLIJG557skdIXw3Gfny6buUrLAN/xIBbMfRR7Gl/f
         2YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398436; x=1769003236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jT5+6PNxAsiSLc4phs+HsvpCwG6ks9aQbUheKgFsmM=;
        b=A9XfCF5hr8SYHdJarR2IYmfbAfC8jgX1a3U5Q/49s7CMB/6enspXKajFvE5b+4ePqp
         3fp7igiap10RUa4kRS1xyk3yDGM7mz9sby+K2I7Lrafm4naLOgnjv65V5jpEYSfEVfiO
         LTdGleG0IB1Xe92HgBhpCOAmS7/+xxg8AVpCA90zQu67NOQIzRufxHoBgP5x3J43GjR7
         m0gaz/jdMgNZTj0+rswzccv4rMU6wv/k7xMmfbkHM9qx/MPRAKLrYDtI1kXCXUfidE9K
         58J19JZkL72eM4v+M2yKeDWzkooni+mY0H9xY9TbKd55iHBrwbXh6Ow4IKq1KH4MLvwU
         GjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCRhPLntDE10quElv7cTHliZ8fIwq8kkQw9xtQM0WYJE9+8OUW5jqkodxX3MOq9ZvfebA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylqf4tcst3McDKh/HqFSehxRMuHuVFI6rvC83UfS7C2VsIiZM/
	4YeL9SHyirl1dLoi7vwffb0U1pyxnWT3+Cm+YFMU0oLB1Jq0edx7/Vvw
X-Gm-Gg: AY/fxX4ZhVD/7u0I7rp06R4iWG25SG+6CGi2VXpssbrbrUQnBOCjzPWkk/f5q7LuXZe
	1NJkyu2jZpzJstxFPcAC2x9mxOsDJpScdUBGq0nASu3xiy7L6Axp7lteDmq9EsWgCkRZii68oKy
	0AAQMbhS2xTP2p8E5rAv0MYOViIqV3fEXk7R7fC3oY6a23I7M02jbE5qrmcCm6Zia71rs8MhMVf
	Ibsb/UDLQvQCzoHTIlXQ+a0bLnE2VVS3eKjOjiK6TjXLbg+aNLTQkGx6AVxruZYsywtyJ6+QQkx
	VGNFBRwzFohIB4uNeA8n5fGiufbHrsL9ioFGYNaDbRb0kDQwGIf/BcBbU62REBcQr5q5MNZjJmt
	BqHEfLRirGk5Qc7KhTqhcHPPQXCulL2Do0EpPTC21DU+nXO6cT1fCJraoURDApIZrpGNo9cCZxG
	u2Py/wxRoyg7lS/XE6io+6zDkCLFyz7PNnzusZqHE/b4KCC5Yec3hI
X-Received: by 2002:a05:600c:83c3:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47ee32fcf0amr27966825e9.11.1768398435487;
        Wed, 14 Jan 2026 05:47:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm5184825e9.16.2026.01.14.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:47:15 -0800 (PST)
Date: Wed, 14 Jan 2026 13:47:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: shenwei.wang@nxp.com, xiaoning.wang@nxp.com, frank.li@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 bpf@vger.kernel.org
Subject: Re: [PATCH net-next 07/11] net: fec: use switch statement to check
 the type of tx_buf
Message-ID: <20260114134713.565f2b3c@pumpkin>
In-Reply-To: <20260113032939.3705137-8-wei.fang@nxp.com>
References: <20260113032939.3705137-1-wei.fang@nxp.com>
	<20260113032939.3705137-8-wei.fang@nxp.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jan 2026 11:29:35 +0800
Wei Fang <wei.fang@nxp.com> wrote:

> The tx_buf has three types: FEC_TXBUF_T_SKB, FEC_TXBUF_T_XDP_NDO and
> FEC_TXBUF_T_XDP_TX. Currently, the driver uses 'if...else...' statements
> to check the type and perform the corresponding processing. This is very
> detrimental to future expansion. For example, if new types are added to
> support XDP zero copy in the future, continuing to use 'if...else...'
> would be a very bad coding style. So the 'if...else...' statements in
> the current driver are replaced with switch statements to support XDP
> zero copy in the future.

The if...else... sequence has the advantage that the common 'cases'
can be put first.
The compiler will use a branch tree for a switch statement (jumps tables
are pretty much not allowed because of speculative execution issues) and
limit the maximum number of branches.
That is likely to be pessimal in many cases - especially if it generates
mispredicted branches for the common cases.

So not clear cut at all.

	David
