Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341612;
	b=NCi24aj7uGzF7cCiCgDZMA2PxtOIF2UPCJnQrSGGTS9BGyBxHm8ZrDIbX6JuEey2EZ0+
	 ibkWi2ZGmiyu+FLO/IWjPmbgWfki0eTvJBVe8yIr0MLe/Z9aJ7ywXZk1OPrp7CA1V/BZn
	 oFj5VI4RIubWKKK09XiNAO+toz8cJW+mznWVNPcxrfIobRlIAavYpsdU03GJlYlMQuJ4x
	 Lf1k1PQmvQHGZUQWHjha8jftxA54Suw+3mtIz1ioV8fYngXrHxaAcKfB8ubO7QierN/VP
	 +rANhF0ux3V4b3pWEZjtyR0T9/9fgssj6GvJRIJfkQ4zSMrLM1+m+QMz9KjVC5mogEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
	b=TIgxknNgEtQKO8GUKMUs9SRsVx5ey8hjgSx+n8etTGiFS/4D9DRF+6Wit690flN3sr7E
	 Gyktxt/p+ICwfzQMSEg5gx8JNKrAjxbUmM/pg8ACPQ+95pp+3ygui1/XBpu6vXnqNhRJy
	 cJ5p3W9dhtvX1qhM4omv6PCiFezqmxf+NnZr7wNg/jWWu1A2eRTblD2+hi/onk2eld2MI
	 0vjQoWviA9mb8pVtkjYMXIyEw/LWBCuTtwKEYRNnr9MEkJ8xTguVzVM5q+fl4E0jIJlCz
	 nYLm7L6hjDfDfFSFbaXrnDB5VkiCkpb0J3Qw5T0bKmh4XHZzyKY6P1p2FJQTpzHxZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/e1BG9F";
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61FB606A321
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 06:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/e1BG9F
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679a2b540f3so290693d50.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341610; x=1793946410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=Z/e1BG9FcmM0tGe7QuH2x7AbRxJ5ZO6kSstketwKQhZWVqVh7j624K3JGFf8FVRnPF
         DV4p4nNjvQ+ZFwcafx8hcVsEo13dlvuPcVdQ68hdJ8d6u/mvGTfHoaXdVU1RsoSOymzC
         /nsBsVjnx0DAsASf/K4JNFufotOg9tFAI8sYEQhIW95Dz579+vsUVtOQrXrNokCaEwAl
         JDWr4Y0SeEJ3xaGXzge36bNKRXmseTcJvwFrYDBziGwzo7PUTVYvGZjmtTqsa8a7NESc
         gmewq50b9vABJrkgFZ+UzFJtKKqlx55FUEFP/ux1gsm/KS33ziU4gDWdW0vaYo7JITxb
         xZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341610; x=1793946410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=maDnEzljnq27j+131e31R4VJYpxmHi1+wSKU2ItxK91w+hqQhXK0FQ+RNgLC1Yg/di
         AXvVo/wex1zk8iTSoBjRtVoAAb1p391WGY+ZkCOyoM4eRfn8FUqVn1AsEsLysBFCo/vN
         d3RLG0jXH/c/CpSFaixrtkBrUy4DWLM+j0aVMGF8WaAszIxrUK1wMecvwniAJOkc6xTl
         YfieWwkPU7rf5zkgvPtGEToV77Se10BG9MkHjJ4/SlsY/+0DF0bKyLdSGqJDR9QtUA/a
         Cwf5Y7Eh+m5xs/pYxGkPKI+LxcO/cilwb1ZXpokaGpM6VFCNSPG8egcu+GhuAqex/cqL
         8gDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEeydF9xJjrpWE62yIUN0mfwgQgqErLf7u9BTcHw7BMhFpmH21erhOCF/5fOjFjUQjhuY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJB9qF1duq8EJ9KenYczYcfDWabEAoZz24SnBuB9LLRA8bukUEw
	cL/e19hl7tnszkyjxVG030r37OUgYZWgshUASAh1mh1YS3HY8y0pfCVx
X-Gm-Gg: AYBFou0Q+/mmm2pqKlJRCfCjuFAAfRn0hOfm47b/JFDvd4I638ewNOJs9RTx/3pb0w6
	C+xdZsrBKAmCtKcuZXnWaS8OJZPi+gK2LgQhTA24ATR5bFCyniPGqRHfzpFclPEHIRv7Yf8sRr4
	W969wp0V7mmEKBCis5t+ibZM2ec5qkghb+H8uFx9FxpmwBODb+iKYSPz/yefb8j5hnR3a0ItKkb
	Wc9EwOlpBK26e3ja1PcpQl5Vgyy4LuWx4njDOkXL33AJyJNwqzvDCkjbVYxHaTSIfBzccSAdxws
	JnpuegvGZxdeBuw2yFYq4S0ehV8G+LliXnJu4KPlRHt9W3L2R2nyy175g9R63MxybNV064KTbB2
	TsNzDQZeJST6qQbeyaKvwgfqPiQgnxAftgKJb9Hwh0Wm57I4SGDYVT4MXShAS05CeNwvQhjZzfk
	ywuJC9MTr8W3xIk/348f9SSCFF2EK5Pq+ANVnPYJcBtoFMBz5RgPYq1Uolev4DcG0VAGtPdqngg
	TCNOavJzzkXuO5vNKhgvbJ6HX5wflhMdg2IRKGlkCVqq6qBRS7xEQVh+cXDIo95ChaUk/cQ2E2L
	sdgd/P4dNV9fQrfBxo9cb7tNcv2iAo27xXNi2RrwXHzrPtqnpaYocNoWDOa98ay0GcbhUsnelUN
	R5/ksEzUw
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr7452207b3.30.1793341609736;
        Thu, 29 Oct 2026 23:26:49 -0700 (PDT)
Received: from [192.168.68.58] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm4625317b3.33.2026.10.29.23.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:26:48 -0700 (PDT)
Message-ID: <dcd98f40-387d-4a64-a39d-9d1c7296ec7a@gmail.com>
Date: Thu, 29 Oct 2026 23:26:46 -0700
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget
 registration
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Xu Yang <xu.yang_2@oss.nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
 <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Finally had time to test, and it works. Thanks!


Tested-by: Rudraksha Gupta <guptarud@gmail.com>

