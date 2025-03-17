Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA6290F
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201280; cv=none; b=f0qM4xAZKf4jvkj1jSPlBf8k6npO8AAD8b/GtBDKMER4yZgj+8chKFxu46DEQBZMegAV6usnhEG2nJ5/wEzhhzPjRmUNmMODjH4RNKTQkuldM1cwVf4DYIQj3v9HD03eI0MDq3jszM/ugFLTHxgqQKUZFunoC9+DdAfu5wwf4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201280; c=relaxed/simple;
	bh=JWF40QUvcWkqOKGgqM72bACfGKf0BSEtJRD7IGnHZXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAb4Jy2wmk50cRwYnYArYB7f4IoYWRCVjLaRb8Yx1mJL46jlaeUv7xFYs8KAL1IHu0Nj0bkfqOaERH/3VDt6h4tFSxXSdeZzPVQ5Aq6EFjXanzxycVmYqql0EB7vE6zIvmu4fZDli/9X1VxtJdTb9OjGtgWyEI77OgqSo6ohrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmZkeC9v; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmZkeC9v"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf3d64849dso666960466b.3
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742201277; x=1742806077; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sivy2dFPDfrrWNy8pgqRVOZc7Oa4LQfVg4rx4RY+3RE=;
        b=NmZkeC9vWGTLXtNhrnWb3fg5jrMrMISrYA02+6A/BLkA2tWHWYCAdW2Pr2Yi2fwxRn
         3+95YENGSv+Qmdsz5OCK3WLQLl07PgTGqoobHOStSTSr7O+n9cybzM8FhwQvHx+HFhhf
         VQo2UUPMO1fED0Qp3jExPzOWOmzm83i5QxhFzyGj/yD/2tf6q6wAA1xwiCaSFBfzq8g5
         1C1LLGtiMIoj8LOcb9qEjgIm6djz2M1tIKkVkKMlXOtcvJlTgHQUgV+l9O5e/HP2FAHa
         dopmt94AygLTxKPM/7/mxOXe7U5Ql4jiIQe0j9EIgA82PmYk2ICPAKUeY6aeQrfKPFN3
         ML6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201277; x=1742806077;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sivy2dFPDfrrWNy8pgqRVOZc7Oa4LQfVg4rx4RY+3RE=;
        b=qa4zWcVWLeHnHz+HKNZb5B8KAeXROBAE86Gq6agJ9HoiLAb+n/RnRV3rbIWp9bMYgf
         VDJBJolycIdTd9hN/4AbKRL05dKM0kBL/yWpO53r7Og3p/a/YkfDciNJoKTWX4d6yL+b
         vOWH7XJ5y9awNUTMW8hhdDvvDbshnMGJTomppWKpoUBgi2YzgkrH3rI3oSsSpRCqKk6e
         0KGI4QoFs8i3ZuK8zyWz5X9RcPzMmNKNvZhDcUbYtVlrrR0OQ8xyQyJ84M+t1uW4roRw
         X4DjqpuR1voaJlRci0HewfnNITh8NtN/ioULMNsIOta/WHP7sixp60oiDiICXTvHw1uP
         nkag==
X-Forwarded-Encrypted: i=1; AJvYcCUk+6ogcS+0IKXOhmGN2OEUwfoRMtG8SnU2KROyiNwC8hWQXpZ1CSNxImkztWU2yJJYJAs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuSyOPi08n3DTtQvOJ+M10gKDDFIqXmxRG6iMWyPKM3twH4Fxn
	0aQK26Cr8ilciwDi1Iazv1nYcWY73G12g8skwWh6xsPjBDhFwKgaeNvgvQ==
X-Gm-Gg: ASbGncui781e6QW1lX2EU/AUeVUOLMtDcXsSfueEWcXOxeHKZXlcSlHuEhckcn0qnhv
	ykI4IAEYQWoZ4OQUo3ay3qjmW4udAKMzRaMXO/4CqVR5YsL7VM9D7WqcVeKT6hQrEkpQ65JVXfY
	eooZB8xyQlRpV4TtogKMjkOZXInEt7rljHNBC0cD2MaDBJDUvjejq0B8JcJoO7AMV//gcbtrftV
	L6a0BciXaLkNkK245EgG+Ls1COiF6aQTVjVj0NLVvMwt0Vmohg+CMTHS5Nng22J9q4eDnZB8gd+
	8XLNcoXFBbNFXrMB82Yw0zK9aB8f9WCEIe7Zp2hq+nY/rNIq4EkbNNONGf4BTegTfcd/0GWNsyo
	9XEuRaF6lWk1KA4M2Ye5vQIq2JiA6uy+GBD95YSVfwZo=
X-Google-Smtp-Source: AGHT+IHWG4ioeUkKOqbyjHVa3nGcDKasGMk84coU/EEXrQ9CgoA9EeOa+Ei+KVhgfcSMQroZdbmSgQ==
X-Received: by 2002:a17:907:7296:b0:abf:6e22:cac7 with SMTP id a640c23a62f3a-ac330263c1dmr1241552766b.15.1742201277303;
        Mon, 17 Mar 2025 01:47:57 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea41sm622028666b.28.2025.03.17.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 01:47:57 -0700 (PDT)
Date: Mon, 17 Mar 2025 09:47:53 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: shawnguo@kernel.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While playing with linux-next and imx93-11x11-evk via NFS and TFTP
I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
not builtin then the I was not able to reach userland. 

The following configs were needed to reach my goal:
CONFIG_DWMAC_IMX8=y
CONFIG_STMMAC_ETH=y
CONFIG_NVMEM_IMX_OCOTP_ELE=y

is that something expected?

Regards,
Alberto
